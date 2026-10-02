---
name: add-endpoint
description: Dodaje nowy endpoint API przez wszystkie warstwy — serwis (data), repozytorium (domain+data), use case (domain), mapper (data). Pełny pionowy slice. Podaj nazwę operacji i ścieżkę API.
argument-hint: "[operacja, np. getUserFeed]"
---

# Add Endpoint — Dynamic RCB Alerts

Dodaj nowy endpoint API przez wszystkie warstwy clean architecture.

## Input

- **Operacja**: `$ARGUMENTS` (np. `getUserFeed`, `createPost`)
- Zapytaj jeśli brakuje: ścieżka API, metoda HTTP, request/response body, do którego feature'u należy

## Kolejność tworzenia (bottom-up)

### 1. Response DTO (jeśli nowy model)
**Plik**: `packages/data/lib/src/model/{feature}/{name}_dto.dart`

Freezed + JsonSerializable, nullable pola. Patrz wzorzec w `/add-model`.

### 2. Request DTO (jeśli potrzebny)
**Plik**: `packages/data/lib/src/model/{feature}/{name}_data_dto.dart`

Freezed + JsonSerializable dla request body.

### 3. Serwis — interfejs
**Plik**: `packages/data/lib/src/service/{feature}/{feature}_service.dart`

Dodaj metodę do istniejącego abstract class:
```dart
Future<{ResponseDTO}> {methodName}({
  required {RequestDTO} data,
});
```

### 4. Serwis — implementacja
**Plik**: `packages/data/lib/src/service/{feature}/{feature}_service_impl.dart`

```dart
@override
Future<{ResponseDTO}> {methodName}({
  required {RequestDTO} data,
}) async {
  return _apiClient.post(
    '/api/v1/{resource}',
    data: data.toJson(),
    mapper: (json) => {ResponseDTO}.fromJson(json as Map<String, dynamic>),
  );
}
```

Wzorce API:
- GET lista: `_apiClient.get(path, mapper: ...)` z paginacją
- GET szczegóły: `_apiClient.get('$path/$id', mapper: ...)`
- POST tworzenie: `_apiClient.post(path, data: dto.toJson(), mapper: ...)`
- PUT edycja: `_apiClient.put('$path/$id', data: dto.toJson(), mapper: ...)`

### 5. Mapper
**Plik**: `packages/data/lib/src/mapper/{feature}_mappers.dart`

Extension methods: `toDomain()` na DTO, `toData()` na domain request model.

### 6. Domain entity (jeśli nowy model)
**Plik**: `packages/domain/lib/src/model/result/{feature}/{name}.dart`

Freezed, non-nullable where possible. Patrz `/add-model`.

### 7. Domain request model (jeśli potrzebny)
**Plik**: `packages/domain/lib/src/model/request/{name}_data.dart`

### 8. Repository — interfejs
**Plik**: `packages/domain/lib/src/repository/{feature}_repository.dart`

Dodaj metodę:
```dart
Future<{DomainResult}> {methodName}({required {DomainParam} data});
```

### 9. Repository — implementacja
**Plik**: `packages/data/lib/src/repository/{feature}_repository_impl.dart`

```dart
@override
Future<{DomainResult}> {methodName}({required {DomainParam} data}) async {
  final result = await _service.{methodName}(
    data: data.toData(),
  );
  return result.toDomain();
}
```

### 10. Use Case
**Plik**: `packages/domain/lib/src/usecase/{feature}/{name}_use_case.dart`

```dart
@injectable
class {VerbNoun}UseCase extends BaseUseCase<{Param}, {Result}> {
  {VerbNoun}UseCase(this._repository);
  final {Feature}Repository _repository;

  @override
  Future<{Result}> execute({Param} param) =>
      _repository.{methodName}(data: param);
}
```

## Checklist po stworzeniu

- [ ] Wszystkie pliki eksportowane w barrel files
- [ ] Mapper pokrywa wszystkie pola
- [ ] `make builder` uruchomiony (domain -> data -> app)
- [ ] Endpoint przetestowany (lub test stub stworzony)
