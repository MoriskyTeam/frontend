# Handoff BE — alarm o niebezpieczeństwie (push, który budzi telefon)

Status: **do wdrożenia po stronie BE.** Aplikacja Flutter jest budowana
pod ten kontrakt równolegle — nazwy tabel, RPC i pól payloadu są wiążące.

## Co budujemy

Gdy w pobliżu telefonu pojawia się poważne zagrożenie, telefon dostaje push,
który na Androidzie **włącza ekran alarmu na blokadzie, gra dźwięk budzika
(także w trybie cichym), wibruje i miga latarką**, a na iOS pokazuje
powiadomienie *Time Sensitive* z dźwiękiem alarmu.

Dwa wyzwalacze:

1. **Automatyczny:** wiersz w `public.incidents` staje się aktywnym
   zgłoszeniem `severity = 'high'` (nowy albo podniesiony z niższego).
2. **Ręczny (operator):** operator wstawia wiersz do `public.operator_alerts`
   (Table Editor w Supabase albo SQL).

Odbiorcy: urządzenia z włączonymi alarmami, których ostatnia znana pozycja
leży w promieniu **max(5 km, `area_radius_meters`)** od zgłoszenia, albo
`radius_m` dla alertu operatora. Każde urządzenie dostaje alarm **raz na
źródło** — aktualizacje tego samego zgłoszenia nie budzą ponownie.

```text
app ──register_push_device()──▶ push_devices
incidents (high) ─┐
operator_alerts ──┴─ trigger (pg_net) ─▶ Edge Function send-alarm
     └─ claim_alarm_recipients() ─▶ alert_deliveries (dedup)
     └─ FCM HTTP v1 ─▶ Android (data-only) / iOS (APNs time-sensitive)
```

Projekt: `mshhfivprfvgzrkhqwga` — **dziś jeden wspólny dla dev i prod**, więc
każdy test alarmu dzwoni u wszystkich zarejestrowanych w promieniu. Do testów
używaj `operator_alerts` z małym `radius_m` (np. 200 m) w miejscu, gdzie jest
tylko Twój telefon.

## 1. SQL

Uruchomić w SQL Editor w tej kolejności. Wymaga rozszerzeń `postgis` (już
jest), `pg_net` i Vault (domyślnie w Supabase).

```sql
-- ── Urządzenia ────────────────────────────────────────────────────────────
create table public.push_devices (
  token          text primary key,            -- FCM registration token
  user_id        uuid not null references auth.users (id) on delete cascade,
  platform       text not null check (platform in ('android', 'ios')),
  lat            double precision,            -- ostatnia znana pozycja,
  lng            double precision,            -- aplikacja zaokrągla do ~100 m
  geog           geography(point, 4326) generated always as (
                   case when lat is null or lng is null then null
                        else st_setsrid(st_makepoint(lng, lat), 4326)::geography end
                 ) stored,
  alarms_enabled boolean not null default true,
  locale         text,                        -- 'pl' / 'en', na przyszłość
  updated_at     timestamptz not null default now()
);

create index push_devices_geog_idx on public.push_devices using gist (geog);
create index push_devices_user_idx on public.push_devices (user_id);

alter table public.push_devices enable row level security;

create policy "residents see their own devices"
  on public.push_devices for select to authenticated
  using (user_id = auth.uid());
-- Brak polityk insert/update/delete: zapis tylko przez register_push_device().

-- Rejestracja / odświeżenie urządzenia. Upsert po tokenie — po reinstalacji
-- token przechodzi na nowego anonimowego użytkownika.
create or replace function public.register_push_device(
  p_token          text,
  p_platform       text,
  p_lat            double precision default null,
  p_lng            double precision default null,
  p_alarms_enabled boolean default true,
  p_locale         text default null
) returns void
language plpgsql security definer set search_path = public as $$
begin
  if auth.uid() is null then
    raise exception 'not signed in' using errcode = '28000';
  end if;
  insert into push_devices (token, user_id, platform, lat, lng,
                            alarms_enabled, locale, updated_at)
  values (p_token, auth.uid(), p_platform, p_lat, p_lng,
          p_alarms_enabled, p_locale, now())
  on conflict (token) do update set
    user_id        = excluded.user_id,
    platform       = excluded.platform,
    lat            = coalesce(excluded.lat, push_devices.lat),
    lng            = coalesce(excluded.lng, push_devices.lng),
    alarms_enabled = excluded.alarms_enabled,
    locale         = coalesce(excluded.locale, push_devices.locale),
    updated_at     = now();
end $$;

revoke all on function public.register_push_device from public, anon;
grant execute on function public.register_push_device to authenticated;

-- ── Alerty operatora ──────────────────────────────────────────────────────
create table public.operator_alerts (
  id          uuid primary key default gen_random_uuid(),
  title       text not null,
  body        text,
  lat         double precision not null,
  lng         double precision not null,
  radius_m    integer not null default 5000 check (radius_m between 50 and 100000),
  incident_id text references public.incidents (id),  -- opcjonalnie: otwórz to zgłoszenie
  created_by  uuid default auth.uid(),
  created_at  timestamptz not null default now()
);

alter table public.operator_alerts enable row level security;
-- Brak polityk: insert tylko z dashboardu / service role.

-- ── Deduplikacja ──────────────────────────────────────────────────────────
create table public.alert_deliveries (
  source_id text not null,                   -- 'incident:<id>' / 'operator:<uuid>'
  token     text not null references public.push_devices (token) on delete cascade,
  sent_at   timestamptz not null default now(),
  primary key (source_id, token)
);

alter table public.alert_deliveries enable row level security;
-- Brak polityk: tylko service role.

-- Wybiera urządzenia w promieniu, które jeszcze nie dostały alarmu z tego
-- źródła, i od razu zapisuje dostarczenie (atomowo — retry triggera nie
-- dzwoni drugi raz).
create or replace function public.claim_alarm_recipients(
  p_source_id text,
  p_lat       double precision,
  p_lng       double precision,
  p_radius_m  double precision
) returns table (token text, platform text, locale text)
language sql security definer set search_path = public as $$
  with targets as (
    select d.token, d.platform, d.locale
    from push_devices d
    where d.alarms_enabled
      and d.geog is not null
      and st_dwithin(d.geog,
                     st_setsrid(st_makepoint(p_lng, p_lat), 4326)::geography,
                     p_radius_m)
  ), claimed as (
    insert into alert_deliveries (source_id, token)
    select p_source_id, t.token from targets t
    on conflict do nothing
    returning alert_deliveries.token
  )
  select t.token, t.platform, t.locale
  from targets t join claimed c on c.token = t.token;
$$;

revoke all on function public.claim_alarm_recipients from public, anon, authenticated;

-- ── Wyzwalacze → Edge Function ────────────────────────────────────────────
create extension if not exists pg_net;
create schema if not exists private;

-- Sekrety w Vault (podmień <project-ref> i wygeneruj losowy sekret):
select vault.create_secret(
  'https://mshhfivprfvgzrkhqwga.supabase.co/functions/v1/send-alarm',
  'send_alarm_url');
select vault.create_secret('<losowy-sekret-min-32-znaki>', 'alarm_webhook_secret');

create or replace function private.notify_send_alarm() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  perform net.http_post(
    url     := (select decrypted_secret from vault.decrypted_secrets
                where name = 'send_alarm_url'),
    headers := jsonb_build_object(
                 'Content-Type', 'application/json',
                 'x-alarm-secret', (select decrypted_secret from vault.decrypted_secrets
                                    where name = 'alarm_webhook_secret')),
    body    := jsonb_build_object(
                 'table', tg_table_name,
                 'type', tg_op,
                 'record', to_jsonb(new)),
    timeout_milliseconds := 10000
  );
  return new;
end $$;

-- Nowe zgłoszenie od razu wysokie.
create trigger incidents_alarm_on_insert
  after insert on public.incidents
  for each row
  when (new.severity = 'high' and new.status <> 'resolved')
  execute function private.notify_send_alarm();

-- Zgłoszenie podniesione do wysokiego albo ponownie otwarte. Masowe
-- upserty synchronizacji, które nic nie zmieniają, nie odpalają triggera.
create trigger incidents_alarm_on_escalation
  after update of severity, status on public.incidents
  for each row
  when (new.severity = 'high' and new.status <> 'resolved'
        and (old.severity <> 'high' or old.status = 'resolved'))
  execute function private.notify_send_alarm();

create trigger operator_alerts_alarm
  after insert on public.operator_alerts
  for each row
  execute function private.notify_send_alarm();

-- Opcjonalnie (pg_cron): sprzątanie urządzeń nieaktywnych 60 dni.
-- select cron.schedule('push-devices-cleanup', '0 3 * * *',
--   $$delete from public.push_devices where updated_at < now() - interval '60 days'$$);
```

## 2. Edge Function `send-alarm`

Kod: [`supabase/functions/send-alarm/index.ts`](../supabase/functions/send-alarm/index.ts)
(Deno, bez zależności poza `@supabase/supabase-js`; token Google OAuth
podpisywany WebCrypto).

```bash
supabase link --project-ref mshhfivprfvgzrkhqwga
supabase secrets set \
  FIREBASE_SERVICE_ACCOUNT="$(cat service-account.json)" \
  ALARM_WEBHOOK_SECRET='<ten-sam-sekret-co-w-Vault>'
# Trigger uwierzytelnia się sekretem w nagłówku, nie JWT:
supabase functions deploy send-alarm --no-verify-jwt
```

Co robi:

1. Odrzuca żądanie bez poprawnego `x-alarm-secret` (403).
2. `incidents`: tylko `severity = 'high'` i `status <> 'resolved'`;
   promień `max(5000, area_radius_meters)`. `operator_alerts`: `radius_m`.
3. `claim_alarm_recipients()` → lista tokenów (już zapisana jako
   dostarczona).
4. Wysyła FCM HTTP v1 po 100 równolegle; tokeny `UNREGISTERED` / błędne
   kasuje z `push_devices`.
5. Odpowiada `{ sent, failed, removed }`; błędy FCM w logach funkcji.

Znane ograniczenie: dostarczenie jest zapisywane **przed** wysyłką, więc
błąd FCM (np. 5xx) nie jest ponawiany. Do rozważenia retry dla 5xx/429.

## 3. Kontrakt payloadu FCM (wiążący dla aplikacji)

Jedna wiadomość na token:

```json
{
  "message": {
    "token": "<fcm-token>",
    "data": {
      "kind": "danger_alarm",
      "source_id": "incident:abc123",
      "incident_id": "abc123",
      "title": "Zalane przejście podziemne",
      "body": "Rondo Mogilskie",
      "lat": "50.0656",
      "lng": "19.9603"
    },
    "android": { "priority": "HIGH", "ttl": "600s" },
    "apns": {
      "headers": { "apns-priority": "10", "apns-push-type": "alert" },
      "payload": {
        "aps": {
          "alert": { "title": "…", "body": "…" },
          "sound": "alarm.wav",
          "interruption-level": "time-sensitive"
        }
      }
    }
  }
}
```

- **Android: bez bloku `notification`** — tylko `data` + `priority: HIGH`.
  To konieczne, żeby aplikacja sama wybudziła ekran (powiadomienie
  pełnoekranowe). Dodanie `notification` zepsuje alarm.
- Wszystkie wartości w `data` to stringi. `incident_id` może być pusty
  (alert operatora bez zgłoszenia).
- `title`/`body` dziś po polsku (z `incidents.title`/`address` albo z
  `operator_alerts`). `push_devices.locale` jest zbierane na przyszłość.

## 4. Firebase / Apple (jednorazowo)

- [ ] Konto serwisowe w projekcie Firebase `dynamic-rcb-alerts` z rolą
      **Firebase Cloud Messaging API Admin**; klucz JSON → sekret
      `FIREBASE_SERVICE_ACCOUNT`. Nie commitować.
- [ ] Włączone *Firebase Cloud Messaging API (V1)* w Google Cloud.
- [ ] iOS: klucz **APNs Auth Key (.p8)** wgrany w Firebase → Project
      settings → Cloud Messaging (bez tego iOS nic nie dostanie).
- [ ] iOS: w Apple Developer dla `dev.slavis.dynamicrcbalerts` włączone
      *Push Notifications* i *Time Sensitive Notifications*.
- [ ] (później) Wniosek do Apple o **Critical Alerts** — pozwoli przebić
      przełącznik wyciszenia na iOS.

## 5. Jak wysłać alarm ręcznie (operator)

```sql
insert into public.operator_alerts (title, body, lat, lng, radius_m)
values ('Ewakuacja — wyciek gazu', 'ul. Grodzka 5, kieruj się na Planty',
        50.0590, 19.9380, 800);
```

Opcjonalnie `incident_id` — wtedy „Rozumiem” w aplikacji otwiera mapę na
tym zgłoszeniu.

## 6. Test end-to-end

1. Zainstaluj build z App Distribution, otwórz mapę (aplikacja zarejestruje
   urządzenie) → w `push_devices` pojawia się wiersz z Twoim `lat/lng`.
2. Zablokuj telefon, włącz tryb cichy.
3. Wstaw `operator_alerts` 100 m od siebie z `radius_m = 200`.
4. Oczekiwane: `net._http_response` ma 200, logi funkcji `sent: 1`,
   telefon budzi się z alarmem.
5. Ponowne `update incidents ...` tego samego zgłoszenia → brak drugiego
   alarmu (wiersz w `alert_deliveries`).

## Pytania otwarte dla BE

- Czy synchronizacje (19115, IMGW) mogą zapisać `severity = 'high'` dla
  starych / historycznych zdarzeń? Jeśli tak — dodać warunek na
  `reported_at > now() - interval '2 hours'` w triggerze insert.
- Retencja `alert_deliveries` (np. 30 dni) i `push_devices` (60 dni).
- Osobny projekt Supabase dla dev, zanim alarmy pójdą do szerszych testów.
