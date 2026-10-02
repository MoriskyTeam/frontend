# Product

<!-- impeccable:product-schema 1 -->

## Platform

adaptive

One Flutter codebase shipped to Android, iOS and Web. One brand world across
all three; platform-native affordances (back gesture, sheets, safe areas,
haptics) follow each OS.

## Users

Primary: a **resident of Kraków on the move** — on a tram, walking to work,
about to leave home. They open the app for a few seconds to answer "is
anything going on around me right now?" (no power, contaminated water,
flooded underpass, fallen tree, bad air, storm warning) and, when they see a
problem themselves, report it in under ~15 seconds with a photo and their
location.

Secondary (demo context): the HackYeah jury watching several phones sync the
same live map in real time.

## Product Purpose

CityShield (working name; repo name "Dynamic RCB Alerts") turns one-way city
reporting (19115-style) into a live, two-way picture of what is happening
around you. It aggregates official open data — city issue reports, IMGW
weather warnings, GIOŚ air-quality stations — and merges it with fast
micro-reports from residents on one live map.

Success: a resident learns about a nearby disruption before it affects them,
and a report they file appears on other people's maps within seconds.

## Positioning

Official sources and neighbours on the same live map, updated in real time.
Official 19115 portals are write-only forms; weather/air apps show one source
each. CityShield shows them together, around you, as it happens.

## Operating Context

- One-handed phone use outdoors, often in sunlight or at night, often in a
  hurry.
- Glance first (map + nearest alerts), act second (report).
- Live updates arrive over WebSocket/SSE from the backend built by a teammate;
  the Flutter app currently runs on **mock data** only.

## Capabilities and Constraints

- Map with layer filtering: **Awarie / 19115** (city issues), **Jakość
  powietrza** (GIOŚ stations, AQI), **Ostrzeżenia** (IMGW weather warnings),
  **Zgłoszenia sąsiedzkie** (resident reports).
- Quick report form: category, photo, geolocation, short note.
- Map: `flutter_map` with OSM-compatible tiles, no API keys.
- Starting view and mock data: **Kraków**.
- Backend is out of scope for this repo's current work; data layer is mocked
  behind the domain repository interfaces so the real feed can be swapped in.
- 24h hackathon build.

## Brand Commitments

Working name "CityShield". No logo, palette or voice assets exist yet.

## Evidence on Hand

None. All incidents, stations and reports are mock data and must be clearly
treated as such; do not invent usage numbers, partners or endorsements.

## Product Principles

1. **Glance in 3 seconds.** The most relevant nearby problem is readable
   without tapping.
2. **Severity is honest.** Calm by default; only genuinely serious events get
   alarm treatment.
3. **Source is always visible.** Official data and neighbour reports are
   distinguishable at a glance.
4. **Reporting is faster than complaining.** Photo + location + category,
   done.
5. **Live means live.** New events visibly arrive; stale ones visibly age.

## Accessibility & Inclusion

Outdoor, one-handed use: large touch targets, high contrast in sunlight,
severity never encoded by colour alone (icon + label too), full Polish
localisation.
