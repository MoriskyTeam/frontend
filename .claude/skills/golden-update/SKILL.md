---
name: golden-update
description: Aktualizuje golden test screenshots po zmianach UI. Uruchom gdy golden testy failują z powodu zamierzonych zmian wizualnych.
disable-model-invocation: true
allowed-tools: Bash(flutter *) Bash(make *)
---

# Golden Test Update

Aktualizuj golden screenshot files po zamierzonych zmianach UI.

## Proces

### 1. Sprawdź które golden testy failują
```
flutter test test/app_test.dart --update-goldens
```

### 2. Zweryfikuj zmiany
Po aktualizacji sprawdź jakie pliki się zmieniły:
```
git diff --name-only test/screenshots/
```

Wylistuj zmienione screenshoty i opisz użytkownikowi co się zmieniło wizualnie.

### 3. Argument: `$ARGUMENTS`

- **Brak argumentu** -> aktualizuj wszystkie golden files
- **Nazwa testu** -> uruchom tylko konkretny test: `flutter test test/app_test.dart --update-goldens --name "$ARGUMENTS"`

## Ważne

- Golden files są w `test/screenshots/`
- Multi-device screenshots: 320x560, 720x1280, reference size
- Upewnij się że zmiany wizualne są **zamierzone** — zapytaj użytkownika jeśli coś wygląda podejrzanie
- Po aktualizacji: `git add test/screenshots/` aby dodać nowe screenshoty
