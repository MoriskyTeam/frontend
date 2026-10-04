// send-alarm — wakes nearby phones with a danger alarm over FCM HTTP v1.
//
// Called by Postgres triggers (pg_net) on `incidents` (severity becomes
// high) and `operator_alerts` (operator inserts a row). Contract and SQL:
// docs/push_alarm_backend.md.
//
// Secrets (supabase secrets set ...):
//   FIREBASE_SERVICE_ACCOUNT  service account JSON with FCM send rights
//   ALARM_WEBHOOK_SECRET      shared with the trigger via Vault
// SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are provided by the runtime.

import { createClient } from "jsr:@supabase/supabase-js@2";

type Row = Record<string, unknown>;

interface Alarm {
  sourceId: string;
  incidentId: string;
  title: string;
  body: string;
  lat: number;
  lng: number;
  radiusMeters: number;
}

interface Recipient {
  token: string;
  platform: "android" | "ios";
  locale: string | null;
}

/** Nobody closer than this to a serious incident is left out. */
const MIN_RADIUS_M = 5000;
const FCM_SCOPE = "https://www.googleapis.com/auth/firebase.messaging";
const BATCH = 100;

Deno.serve(async (req) => {
  if (req.method !== "POST") return json({ error: "method" }, 405);
  const secret = Deno.env.get("ALARM_WEBHOOK_SECRET");
  if (!secret || req.headers.get("x-alarm-secret") !== secret) {
    return json({ error: "forbidden" }, 403);
  }

  const { table, record } = (await req.json()) as {
    table: string;
    record: Row;
  };
  const alarm = toAlarm(table, record);
  if (!alarm) return json({ skipped: true });

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    { auth: { persistSession: false } },
  );

  // Atomically picks devices in range that have not been alarmed for this
  // source yet and records the delivery, so trigger retries and repeated
  // updates never ring twice.
  const { data, error } = await supabase.rpc("claim_alarm_recipients", {
    p_source_id: alarm.sourceId,
    p_lat: alarm.lat,
    p_lng: alarm.lng,
    p_radius_m: alarm.radiusMeters,
  });
  if (error) return json({ error: error.message }, 500);
  const recipients = (data ?? []) as Recipient[];
  if (recipients.length === 0) return json({ sent: 0 });

  const account = JSON.parse(Deno.env.get("FIREBASE_SERVICE_ACCOUNT")!);
  const accessToken = await googleAccessToken(account);
  const endpoint =
    `https://fcm.googleapis.com/v1/projects/${account.project_id}/messages:send`;

  let sent = 0;
  const stale: string[] = [];
  for (let i = 0; i < recipients.length; i += BATCH) {
    const chunk = recipients.slice(i, i + BATCH);
    const results = await Promise.all(
      chunk.map((r) => send(endpoint, accessToken, r.token, alarm)),
    );
    results.forEach((result, j) => {
      if (result === "ok") sent++;
      if (result === "stale") stale.push(chunk[j].token);
    });
  }
  if (stale.length > 0) {
    await supabase.from("push_devices").delete().in("token", stale);
  }

  return json({ sent, failed: recipients.length - sent, removed: stale.length });
});

/** Only active high-severity incidents and operator alerts ring. */
function toAlarm(table: string, r: Row): Alarm | null {
  const lat = Number(r.lat);
  const lng = Number(r.lng);
  if (!Number.isFinite(lat) || !Number.isFinite(lng)) return null;

  if (table === "incidents") {
    if (r.severity !== "high" || r.status === "resolved") return null;
    return {
      sourceId: `incident:${r.id}`,
      incidentId: String(r.id),
      title: (r.title as string | null) ?? "Poważne zagrożenie w pobliżu",
      body: (r.address as string | null) ?? "",
      lat,
      lng,
      radiusMeters: Math.max(
        MIN_RADIUS_M,
        Number(r.area_radius_meters ?? 0),
      ),
    };
  }

  if (table === "operator_alerts") {
    return {
      sourceId: `operator:${r.id}`,
      incidentId: (r.incident_id as string | null) ?? "",
      title: String(r.title),
      body: (r.body as string | null) ?? "",
      lat,
      lng,
      radiusMeters: Number(r.radius_m ?? MIN_RADIUS_M),
    };
  }

  return null;
}

/**
 * One FCM message. Android gets data only, so the app raises its own
 * full-screen alarm; iOS gets a time-sensitive alert with the alarm sound.
 */
async function send(
  endpoint: string,
  accessToken: string,
  token: string,
  alarm: Alarm,
): Promise<"ok" | "stale" | "error"> {
  const message = {
    token,
    data: {
      kind: "danger_alarm",
      source_id: alarm.sourceId,
      incident_id: alarm.incidentId,
      title: alarm.title,
      body: alarm.body,
      lat: String(alarm.lat),
      lng: String(alarm.lng),
    },
    android: { priority: "HIGH", ttl: "600s" },
    apns: {
      headers: { "apns-priority": "10", "apns-push-type": "alert" },
      payload: {
        aps: {
          alert: { title: alarm.title, body: alarm.body },
          sound: "alarm.wav",
          "interruption-level": "time-sensitive",
        },
      },
    },
  };

  const res = await fetch(endpoint, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${accessToken}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ message }),
  });
  if (res.ok) return "ok";

  const body = await res.json().catch(() => ({}));
  const code = body?.error?.details?.find((d: Row) => d.errorCode)?.errorCode;
  if (res.status === 404 || code === "UNREGISTERED") return "stale";
  if (code === "INVALID_ARGUMENT" && /token/i.test(body?.error?.message ?? "")) {
    return "stale";
  }
  console.error("FCM", res.status, JSON.stringify(body));
  return "error";
}

/** OAuth2 access token for the service account (JWT bearer grant). */
async function googleAccessToken(
  account: { client_email: string; private_key: string },
): Promise<string> {
  const now = Math.floor(Date.now() / 1000);
  const header = base64Url(JSON.stringify({ alg: "RS256", typ: "JWT" }));
  const claims = base64Url(
    JSON.stringify({
      iss: account.client_email,
      scope: FCM_SCOPE,
      aud: "https://oauth2.googleapis.com/token",
      iat: now,
      exp: now + 3600,
    }),
  );
  const key = await crypto.subtle.importKey(
    "pkcs8",
    pemToDer(account.private_key),
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const signature = await crypto.subtle.sign(
    "RSASSA-PKCS1-v1_5",
    key,
    new TextEncoder().encode(`${header}.${claims}`),
  );
  const jwt = `${header}.${claims}.${base64Url(new Uint8Array(signature))}`;

  const res = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: jwt,
    }),
  });
  const body = await res.json();
  if (!res.ok) throw new Error(`Google OAuth: ${JSON.stringify(body)}`);
  return body.access_token as string;
}

function pemToDer(pem: string): ArrayBuffer {
  const b64 = pem.replace(/-----[^-]+-----/g, "").replace(/\s+/g, "");
  const bytes = Uint8Array.from(atob(b64), (c) => c.charCodeAt(0));
  return bytes.buffer;
}

function base64Url(input: string | Uint8Array): string {
  const bytes = typeof input === "string"
    ? new TextEncoder().encode(input)
    : input;
  let binary = "";
  for (const b of bytes) binary += String.fromCharCode(b);
  return btoa(binary).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json" },
  });
}
