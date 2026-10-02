---
name: add-usecase
description: Tworzy nowy use case w warstwie domain — klasa BaseUseCase z injectable, aktualizuje repozytorium jeśli potrzeba. Podaj nazwę operacji (np. "GetFeed", "CreatePost").
argument-hint: "[VerbNoun, np. GetFeed]"
---

# Add Use Case — Dynamic RCB Alerts

Stwórz nowy use case w warstwie domain.

## Input

- **Nazwa**: `$ARGUMENTS` (PascalCase, VerbNoun, np. `GetFeed`, `CreatePost`)
- Jeśli nie jasne — zapytaj o: typ parametru, typ wyniku, które repozytorium

## Proces

### 1. Znajdź kontekst
- Sprawdź czy repozytorium już istnieje w `packages/domain/lib/src/repository/`
- Sprawdź istniejące use case'y w tym samym feature area
- Sprawdź czy potrzebny jest nowy request model

### 2. Stwórz use case

**Plik**: `packages/domain/lib/src/usecase/{feature}/{snake_case_name}_use_case.dart`

**Z parametrem:**
```dart
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

@injectable
class {VerbNoun}UseCase extends BaseUseCase<{Param}, {Result}> {
  {VerbNoun}UseCase(this._repository);

  final {Feature}Repository _repository;

  @override
  Future<{Result}> execute({Param} param) =>
      _repository.{methodName}(param);
}
```

**Bez parametru:**
```dart
@injectable
class {VerbNoun}UseCase extends BaseUseCaseNoParam<{Result}> {
  {VerbNoun}UseCase(this._repository);

  final {Feature}Repository _repository;

  @override
  Future<{Result}> execute(void param) =>
      _repository.{methodName}();
}
```

### 3. Aktualizuj repozytorium (jeśli potrzeba)

Jeśli metoda nie istnieje w interfejsie repozytorium — dodaj ją:

**Domain** (`packages/domain/lib/src/repository/{feature}_repository.dart`):
```dart
Future<{Result}> {methodName}({Param} param);
```

**Data** (`packages/data/lib/src/repository/{feature}_repository_impl.dart`):
```dart
@override
Future<{Result}> {methodName}({Param} param) async {
  final dto = await _service.{methodName}(
    data: param.toData(),
  );
  return dto.toDomain();
}
```

### 4. Request model (jeśli potrzebny)

**Plik**: `packages/domain/lib/src/model/request/{snake_case_name}_data.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '{snake_case_name}_data.freezed.dart';

@freezed
sealed class {VerbNoun}Data with _${VerbNoun}Data {
  const factory {VerbNoun}Data({
    required int? userId,
    // ... params
  }) = _{VerbNoun}Data;
}
```

## Export

Dodaj export do barrel file jeśli istnieje (np. `packages/domain/lib/domain.dart`).

## Po stworzeniu

Przypomnij: `make builder` (domain + data jeśli zmieniono repo impl).
