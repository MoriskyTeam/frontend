---
name: analyze-feature
description: Analizuje istniejący feature — pliki, zależności, cubity, use case'y, pokrycie testami, powiązania z innymi feature'ami. Pomocny przed rozszerzaniem lub refaktoryzacją feature'u.
argument-hint: "[feature_name, np. feed, post, auth]"
---

# Analyze Feature — Dynamic RCB Alerts

Przeanalizuj istniejący feature w projekcie Dynamic RCB Alerts.

## Input

- **Feature**: `$ARGUMENTS` (nazwa katalogu, np. `feed`, `post`, `auth`, `circle`)

## Co analizować

### 1. Struktura plików
Znajdź wszystkie pliki feature'u:
- `lib/ui/feature/**/$ARGUMENTS*/` — UI layer (pages, cubits, widgets)
- `packages/domain/lib/src/usecase/$ARGUMENTS*/` — use case'y
- `packages/domain/lib/src/repository/*$ARGUMENTS*` — interfejsy repo
- `packages/domain/lib/src/model/**/*$ARGUMENTS*` — domain models
- `packages/data/lib/src/service/$ARGUMENTS*/` — serwisy API
- `packages/data/lib/src/repository/*$ARGUMENTS*` — repo impl
- `packages/data/lib/src/model/$ARGUMENTS*/` — DTOs
- `packages/data/lib/src/mapper/*$ARGUMENTS*` — mappery

### 2. Zależności cubita
Przeczytaj cubit(y) feature'u i wylistuj:
- Injektowane use case'y
- Factory params (@factoryParam)
- Presentation events

### 3. API endpoints
Przeczytaj serwis feature'u i wylistuj:
- Endpointy (metoda HTTP + ścieżka)
- Request/response DTOs

### 4. Powiązania z innymi feature'ami
Sprawdź:
- Które wspólne cubity są używane (AuthenticationBloc, etc.)
- Czy feature importuje modele z innych feature'ów
- Routing — skąd nawigacja do tego feature'u

### 5. Pokrycie testami
Sprawdź:
- `test/` — czy są testy widgetowe/golden
- `packages/data/test/` — czy są testy repo/serwisu
- `integration_test/` — czy są testy e2e

## Format raportu

```
## Feature Analysis: {feature_name}

### Pliki ({count})
| Warstwa | Pliki |
|---------|-------|
| UI      | ... |
| Domain  | ... |
| Data    | ... |

### Cubity
- {CubitName}: {opis stanu, use case'y, presentation events}

### API Endpoints
- GET /api/v1/... -> {DTO}
- POST ...

### Zależności
- Wspólne cubity: ...
- Importy z innych feature'ów: ...
- Nawigacja: ...

### Pokrycie testami
- Widget/golden: OK/BRAK
- API/repo: OK/BRAK
- Integration: OK/BRAK
- Cubit unit: OK/BRAK

### Obserwacje
- [potencjalne problemy, tech debt, możliwości refaktoryzacji]
```
