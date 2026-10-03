# CityShield — stan backendu Supabase

2026-10-03

> Żywa wersja tego dokumentu (można komentować inline):
> https://claude.ai/code/artifact/376f10b4-8f21-4faf-8dfd-b543ed8e3a21

## Stan: baza gotowa, Twój kod bez zmian

Backend stoi i jest zgodny z `docs/supabase_contract.md`. `supabase_incident_service.dart` nie wymaga żadnej zmiany — `watchIncidents`, `submitReport` (bezpośredni insert pod RLS) i `confirm_incident` działają tak, jak zostały napisane.

```
ref       mshhfivprfvgzrkhqwga
URL       https://mshhfivprfvgzrkhqwga.supabase.co
key       sb_publishable_wBNibGHaaDgNTHW7WOSLfQ_36L1VeX6
Postgres  17.11 + PostGIS 3.3.7
```

W bazie: tabela `incidents` (`id text` jako PK), `incident_confirmations`, funkcja `confirm_incident(text)`, bucket `report-photos`, Realtime włączony na `incidents`, oraz 21 rekordów demo wstawionych z `docs/supabase_seed.sql`.

Pierwsza wersja schematu, która tu stanęła, miała `uuid` jako PK, własne RPC `submit_report` i typy enum — i była niekompatybilna z klientem w sześciu miejscach. Baza została przebudowana pod kontrakt z `docs/supabase_contract.md`, nie odwrotnie.

## Co musisz zrobić

Dwie rzeczy.

**1. Pliki konfiguracyjne.** `bootstrapSupabase()` czyta `String.fromEnvironment`, a Makefile podaje `--dart-define-from-file=config/supabase_<flavor>.json`. Flavory nazywają się `development` i `production`, więc pliki to `config/supabase_development.json` i `config/supabase_production.json` (oba wyłączone z gita przez `config/supabase_*.json`):

```json
{
  "SUPABASE_URL": "https://mshhfivprfvgzrkhqwga.supabase.co",
  "SUPABASE_KEY": "sb_publishable_wBNibGHaaDgNTHW7WOSLfQ_36L1VeX6"
}
```

Bez nich `isConfigured` jest `false`, DI bierze `DataEnvironment.mock` i aplikacja dalej chodzi na mocku — wygląda to tak, jakby nic się nie zmieniło, więc łatwo się na tym naciąć.

**2. Trzy kody w `supabase_error_mapper.dart`.** `confirm_incident` zgłasza jawne błędy z kodami `PTxxx`, żeby PostgREST zwracał prawdziwe statusy HTTP. `postgrestKind` robi na nich `int.tryParse('PT404')`, dostaje `null` i wpada w fallback `ApiErrorKind.server` — czyli wszystkie trzy wyglądają teraz jak awaria serwera:

```dart
'PT400' => ApiErrorKind.validation,
'PT401' => ApiErrorKind.unauthorized,
'PT404' => ApiErrorKind.notFound,
```

Reszta mappera trafia dobrze — `42501`, `23505`, `23514`, `22P02` i `PGRST*` są już obsłużone.

Plus jedna rzecz poza kodem: **trzeba włączyć Anonymous sign-ins** w dashboardzie Supabase. Polityka insertu i grant na `confirm_incident` są `to authenticated`, więc bez sesji ani zgłoszenie, ani potwierdzenie nie przejdzie.

## Odstępstwa od kontraktu

Baza trzyma się `docs/supabase_contract.md`, ale w kilku miejscach jest ostrzejsza albo bogatsza. Poza punktem o `PTxxx` wyżej nic z tego nie wymaga zmian w kodzie.

| Co | Kontrakt | Baza | Dlaczego |
| --- | --- | --- | --- |
| błędy `confirm_incident` | brak | `PT400` / `PT401` / `PT404` | wersja z kontraktu bez sesji wstawiałaby `user_id = null` do klucza głównego i wywalała się surowym błędem PG; teraz wraca czyste 401 |
| grant na `confirm_incident` | `to authenticated` | to samo + jawny `revoke` z `anon` | domyślne przywileje Supabase same nadają `anon` execute na nowe funkcje, więc sam `grant` nie wystarczał — sprawdzone, `anon` dostał się do środka |
| `category` | lista w komentarzu | `check` na 14 wartości | literówka w kategorii to teraz błąd `23514`, a nie cicha wstawka, której `IncidentCategory` nie zmapuje |
| `lat` / `lng` | brak | `check` na zakresy | |
| bucket | public read | + limit 10 MB i MIME `jpeg/png/webp/heic` | większy plik albo nie-obraz poleci `StorageException`, nie przejdzie cicho |
| `updated_at` | ustawiane w `confirm_incident` | + trigger `before update` | nie trzeba go nigdy wysyłać |
| replica identity | brak | `full` | eventy UPDATE w Realtime niosą wszystkie kolumny, więc licznik potwierdzeń dojeżdża kompletny na drugi telefon |
| funkcje ekstra | — | `incidents_nearby()`, `demo_emit_live()` | aplikacja ich nie woła: pierwsza pod scrapery, druga dorzuca punkt na scenie podczas demo |
| stary bucket `reports` | — | istnieje, bez polityk | Storage API nie pozwala usunąć bucketa z SQL — do skasowania jednym klikiem w dashboardzie |

## Co sprawdzone na żywej bazie

- kształt wiersza zgadza się z `IncidentDTO`: `id` jako text (`air-krasinskiego`), `air_reading` jako zagnieżdżony obiekt
- `anon`: `select` 200, bezpośredni insert 401, próba podszycia się pod `city19115` 401
- zalogowany: własne zgłoszenie przechodzi, podszycie pod `city19115` → `42501`, cudze `reporter_id` → `42501`
- dedupe potwierdzeń: pierwsze podbija `inf-004` z 2 na 3 i przerzuca `reported` → `confirmed`, drugie tego samego użytkownika nie rusza licznika
- Realtime: `incidents` w publikacji `supabase_realtime`, replica identity `full`
- po testach baza wyczyszczona: 21 rekordów, `incident_confirmations` puste, `inf-004` z powrotem na 2 / `reported`

Czego **nie** udało się sprawdzić: pełnej ścieżki przez REST z prawdziwą sesją, bo Anonymous sign-ins jest wyłączone. Testy zalogowanego robione były przez podstawienie JWT w transakcji i wycofanie jej, więc logika RLS i dedupe są potwierdzone, ale nie realny round-trip z telefonu. Pierwszy sensowny test po włączeniu logowania to zgłoszenie ze zdjęciem z dwóch telefonów naraz.

## Czego jeszcze nie ma

- **Scrapery 19115 / IMGW.** (GIOŚ jest już w tabelach `gios_stations` + `gios_readings`, aplikacja czyta je bezpośrednio — patrz `supabase_contract.md`.) `id text` okazało się tu wygodne: oficjalne rekordy mogą nosić naturalny klucz źródła (`19115-<numer>`) jako PK, więc ingest to `insert ... on conflict (id) do update`. Idą jako Edge Function + `pg_cron`, service role omija RLS.
- **Anonymous sign-ins** — przełącznik w dashboardzie, bez niego zapisy nie działają.
- **Stary bucket `reports`** do usunięcia.

## Migracje

Schemat jest wersjonowany w repo backendu `cityshield-api`, w `supabase/migrations/`. Ten dokument opisuje tylko to, co z niego wynika dla aplikacji.
