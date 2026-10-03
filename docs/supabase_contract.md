# Supabase contract — CityShield app

What the Flutter app expects from the Supabase backend. The app reads and
writes exactly these names (`packages/data/lib/src/service/incident/supabase_incident_service.dart`).
Firebase stays only for push (FCM) and web hosting.

## App config

Keys go to `config/supabase_<flavor>.json` (gitignored, template in
`config/supabase.example.json`):

```json
{ "SUPABASE_URL": "https://<project-ref>.supabase.co", "SUPABASE_KEY": "<publishable-or-anon-key>" }
```

`make run-dev` / `make run-web` pass the file automatically. Without it the app
runs on the built-in mock feed.

## Auth

The app signs in **anonymously** (`auth.signInAnonymously()`) before it
subscribes. Enable it in *Authentication → Providers → Anonymous sign-ins*.

## Table `public.incidents`

Column names are snake_case and match the app DTO 1:1. Coordinates are plain
`lat` / `lng` columns because Realtime `.stream()` only works on tables, not
views. `geog` is derived from them for PostGIS queries.

```sql
create extension if not exists postgis;

create table public.incidents (
  id                 text primary key,
  layer              text not null check (layer in ('infrastructure','air_quality','weather','neighbours')),
  category           text not null,      -- power_outage, water_outage, heating, flooding, fallen_tree, road,
                                         -- traffic_lights, street_lights, air_quality, storm, wind, heat, smoke, other
  severity           text not null default 'medium' check (severity in ('low','medium','high')),
  status             text not null default 'reported' check (status in ('reported','confirmed','resolved')),
  source             text not null check (source in ('city19115','utility','imgw','gios','resident')),
  title              text,               -- may be null for resident reports (app falls back to category)
  description        text,
  address            text,               -- may be null (app shows coordinates)
  lat                double precision not null,
  lng                double precision not null,
  geog               geography(point, 4326)
                       generated always as (st_setsrid(st_makepoint(lng, lat), 4326)::geography) stored,
  reported_at        timestamptz not null default now(),
  updated_at         timestamptz not null default now(),
  confirmations      integer not null default 0,
  area_radius_meters integer,            -- set for IMGW warning areas
  air_reading        jsonb,              -- GIOŚ stations: {"pm25": 62, "pm10": 88} (µg/m³); the app derives the index
  photo_path         text,               -- public URL in the report-photos bucket
  reporter_id        uuid references auth.users (id)
);

create index incidents_geog_idx on public.incidents using gist (geog);

alter publication supabase_realtime add table public.incidents;
```

### RLS

```sql
alter table public.incidents enable row level security;

create policy "incidents are public"
  on public.incidents for select using (true);

create policy "residents insert their own reports"
  on public.incidents for insert to authenticated
  with check (source = 'resident' and layer = 'neighbours' and reporter_id = auth.uid());
-- No update/delete policies: changes go through RPCs or the service role.
```

## RPC `confirm_incident`

Called from "Też to widzę". Counts at most once per user, promotes a report to
`confirmed` at 3 confirmations, and **returns the updated incident row**.

```sql
create table public.incident_confirmations (
  incident_id text references public.incidents (id) on delete cascade,
  user_id     uuid references auth.users (id) on delete cascade,
  created_at  timestamptz not null default now(),
  primary key (incident_id, user_id)
);
alter table public.incident_confirmations enable row level security;

create or replace function public.confirm_incident(p_incident_id text)
returns public.incidents
language plpgsql security definer set search_path = public as $$
declare
  result public.incidents;
begin
  insert into incident_confirmations (incident_id, user_id)
  values (p_incident_id, auth.uid())
  on conflict do nothing;

  if found then
    update incidents
       set confirmations = confirmations + 1,
           status = case when status = 'reported' and confirmations + 1 >= 3
                         then 'confirmed' else status end,
           updated_at = now()
     where id = p_incident_id;
  end if;

  select * into result from incidents where id = p_incident_id;
  return result;
end $$;

grant execute on function public.confirm_incident(text) to authenticated;
```

## Storage bucket `report-photos`

Public read. A user writes only into their own `<uid>/` folder. The app
uploads `<uid>/<uuid>.jpg` and stores the public URL in `photo_path`.

```sql
insert into storage.buckets (id, name, public) values ('report-photos', 'report-photos', true);

create policy "users upload into their own folder"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'report-photos' and (storage.foldername(name))[1] = auth.uid()::text);
```

## Inserts the app makes

A new report, after an optional photo upload:

```json
{ "id": "res-<uuid>", "layer": "neighbours", "category": "flooding", "severity": "medium",
  "status": "reported", "source": "resident", "description": "…", "lat": 50.06, "lng": 19.94,
  "photo_path": "https://…/report-photos/<uid>/<uuid>.jpg", "reporter_id": "<uid>" }
```

Official sources (19115, utilities, IMGW, GIOŚ) are written by the backend
with the service role.

## Seed

`docs/supabase_seed.sql` holds the Kraków demo data (synthetic) from the app's
mock feed, so the map has content from day one. Its `reported_at` values are
relative to `now()`.
