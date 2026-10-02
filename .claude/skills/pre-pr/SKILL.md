---
name: pre-pr
description: Checklist przed pull requestem — lint, testy, code review i sprawdzenie architektury. Uruchom przed tworzeniem PR.
disable-model-invocation: true
allowed-tools: Bash(make *) Bash(git *) Bash(flutter *)
---

# Pre-PR Checklist

Wykonaj pełny checklist przed stworzeniem pull requesta.

## Kroki

### 1. Status zmian
Pokaż co się zmieniło:
```
git status
git diff --stat
```

### 2. Lint
Uruchom analizę statyczną:
```
make lint
```
Jeśli są błędy — napraw je automatycznie lub zaproponuj poprawki.

### 3. Testy
Uruchom testy:
```
make tests
```
Jeśli testy failują — zdiagnozuj przyczynę.

### 4. Architecture Guard
Sprawdź naruszenia architektoniczne w zmienionych plikach:
- Czy domain nie importuje flutter/data?
- Czy data nie importuje app?
- Czy cubity używają use case'ów (nie repozytoriów bezpośrednio)?
- Czy nowe klasy mają odpowiednie adnotacje (@injectable, @freezed)?

### 5. Code Review
Przejrzyj diff pod kątem:
- Konwencje nazewnicze (snake_case pliki, PascalCase klasy)
- Import order (dart: -> package:flutter/ -> package: -> relative)
- Brak hardkodowanych stringów (powinny być w l10n)
- Brak TODO bez username/URL
- Brak edycji plików generowanych

### 6. Raport
Przedstaw podsumowanie:
```
## Pre-PR Report

### Zmiany
- X plików zmodyfikowanych, Y nowych

### Lint: OK/FAIL
- [szczegóły jeśli błędy]

### Testy: OK/FAIL
- [szczegóły jeśli failują]

### Architektura: OK/FAIL
- [naruszenia jeśli znalezione]

### Code Review: OK/WARN/FAIL
- [uwagi]

### Gotowość: OK Można tworzyć PR / FAIL Wymaga poprawek
```
