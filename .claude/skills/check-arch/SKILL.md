---
name: check-arch
description: Sprawdza naruszenia architektury w projekcie Dynamic RCB Alerts — nielegalne importy między warstwami, złamanie wzorców, brakujące adnotacje. Szybki health-check.
allowed-tools: Bash(grep *) Bash(git *)
---

# Architecture Check — Dynamic RCB Alerts

Sprawdź naruszenia architektoniczne w projekcie.

## Kontrole do wykonania

### 1. Domain nie importuje Flutter ani Data
```bash
grep -r "package:flutter/" packages/domain/lib/ --include="*.dart" -l | grep -v ".freezed.dart" | grep -v ".g.dart"
grep -r "package:data/" packages/domain/lib/ --include="*.dart" -l
grep -r "package:applaudable/" packages/domain/lib/ --include="*.dart" -l
```

### 2. Data nie importuje App
```bash
grep -r "package:applaudable/" packages/data/lib/ --include="*.dart" -l
grep -r "package:flutter_bloc/" packages/data/lib/ --include="*.dart" -l
grep -r "package:go_router/" packages/data/lib/ --include="*.dart" -l
```

### 3. Cubity nie importują repozytoriów bezpośrednio
```bash
grep -r "Repository" lib/ui/feature/ --include="*_cubit.dart" -l
```
Cubity powinny używać use case'ów, nie repozytoriów.

### 4. Brakujące adnotacje DI
```bash
# Repository impl bez @Injectable
grep -rL "@Injectable" packages/data/lib/src/repository/ --include="*_impl.dart"

# Service impl bez @Injectable
grep -rL "@Injectable" packages/data/lib/src/service/ --include="*_impl.dart"

# Use case bez @injectable
grep -rL "@injectable" packages/domain/lib/src/usecase/ --include="*_use_case.dart"
```

### 5. DTOs bez JsonSerializable
```bash
grep -rL "JsonSerializable" packages/data/lib/src/model/ --include="*_dto.dart" | grep -v ".freezed.dart" | grep -v ".g.dart"
```

## Raport

```
## Architecture Health Check

### Naruszenia warstw
- OK/FAIL Domain -> Flutter/Data imports
- OK/FAIL Data -> App imports
- OK/FAIL Cubit -> Repository direct imports

### Spójność DI
- OK/FAIL Repository impls: @Injectable
- OK/FAIL Service impls: @Injectable
- OK/FAIL Use cases: @injectable

### Spójność modeli
- OK/FAIL DTOs: @JsonSerializable
```
