---
version: 1
slug: "lib-features-map"
primary_target: "lib/features/map"
related_targets: ["lib/features/report"]
---

# Surface: Live map + quick report (CityShield)

Scope: `lib/features/map` (live map, layer filters, nearby list, incident detail) and `lib/features/report` (quick report flow). Visitor mode: **Operate**.

Task: a Kraków resident glances at what is wrong around them (3 s) and reports a problem with photo + location (15 s). Content: Supabase incidents across four layers (Awarie/19115, Jakość powietrza GIOŚ, Ostrzeżenia IMGW, Zgłoszenia sąsiedzkie), live arrivals over Realtime. Constraints: flutter_map, no API keys, Android/iOS/Web; no connection means an empty map with an offline state.

## Direction contract

THESIS: A calm, neutral city map where only real threats wear emergency-vehicle livery. Refuses the category default of a rainbow of identical pins on a Google map under a white card sheet.

OWN-WORLD: Asphalt-ink #16181B on road-bone #F4F5F0 (night: asphalt ground, bone ink). Hi-vis fluorescent #D7F100 for the one primary action and live state. Layer liveries: amber #F08A00 (infrastructure), signal red #E5322D (IMGW), patrol blue #1E5BFF (neighbours), GIOŚ index scale for air. Battenburg checker and chevrons appear only on high severity. Barlow Condensed for labels and numbers, Barlow for body. Square-ish 6px corners, 1px hairlines, no soft blobs.

STORY: The resident sees "Kraków · na żywo", the nearest problem with its distance and source, filters layers with chips, taps a point to read it (the rest dims), and hits "Zgłoś" to add their own, which lands on the map live.

FIRST VIEWPORT: Full-bleed light map of Kraków, a top status bar (live dot, count of active alerts within 2 km) with a horizontal row of layer filter chips underneath. A bottom sheet peeks at about 30% with the nearest alert first (checker edge when severity is high), then a list sorted by distance. An extended hi-vis FAB "Zgłoś" sits above the sheet on the right. On wide screens the sheet becomes a 400 px left panel.

FORM: Battenburg emergency livery (candidate 5 of 7; seed 805bc17b). Signature move: the **odblask sweep**: a new live event arrives with a diagonal retroreflective light sweep across its marker and card, like headlights catching tape. Raises: a strict neutral base (from ikeda), focus-expand with the other layers dimmed (from streaming wall), report state as printed marks: outline new / filled confirmed / struck resolved (from centre rail), and every alert carries its proof: source plus age (from monochrome canon).

FINISH: unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict, DESIGN.md, and every shipping raster carrying its provenance
