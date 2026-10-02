---
name: add-model
description: Tworzy nowy model danych we wszystkich warstwach — domain entity (freezed), DTO (freezed + json_serializable) i mapper (extension methods). Podaj nazwę modelu i pola.
argument-hint: "[ModelName]"
---

# Add Model — Dynamic RCB Alerts

Stwórz nowy model danych we wszystkich warstwach clean architecture.

## Input

- **Nazwa modelu**: `$ARGUMENTS` (PascalCase, np. `Post`, `Circle`, `Reaction`)
- Jeśli użytkownik nie podał pól — zapytaj o nie

## Pliki do stworzenia

### 1. Domain Entity
**Plik**: `packages/domain/lib/src/model/result/{feature}/{snake_case_name}.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '{snake_case_name}.freezed.dart';

@freezed
sealed class {ModelName} with _${ModelName} {
  const factory {ModelName}({
    required int id,
    required String name,
    // ... non-nullable where guaranteed
  }) = _{ModelName};
}
```

Reguły:
- Pola non-nullable gdzie wartość jest gwarantowana
- Brak `@JsonSerializable` — domain nie serializuje
- Tylko `.freezed.dart` part file

### 2. DTO
**Plik**: `packages/data/lib/src/model/{feature}/{snake_case_name}_dto.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part '{snake_case_name}_dto.freezed.dart';
part '{snake_case_name}_dto.g.dart';

@freezed
sealed class {ModelName}DTO with _${ModelName}DTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory {ModelName}DTO({
    required int? id,
    required String? name,
    // ... all nullable (API may omit)
  }) = _{ModelName}DTO;

  factory {ModelName}DTO.fromJson(Map<String, dynamic> json) =>
      _${ModelName}DTOFromJson(json);
}
```

Reguły:
- Wszystkie pola nullable (`Type?`) — API może pominąć
- `@JsonSerializable(fieldRename: FieldRename.snake)` na factory
- Oba part files: `.freezed.dart` i `.g.dart`

### 3. Mapper
**Plik**: `packages/data/lib/src/mapper/{feature}_mappers.dart` (nowy lub dopisz do istniejącego)

```dart
extension {ModelName}DTOMapper on {ModelName}DTO {
  {ModelName} toDomain() => {ModelName}(
    id: id!,
    name: name ?? '',
    // ... null coalescing for defaults
  );
}
```

Reguły:
- Extension method na DTO
- `toDomain()` konwertuje DTO -> domain entity
- `!` gdzie pole jest gwarantowane, `??` z defaultem gdzie nie
- Jeśli model będzie też wysyłany do API — dodaj reverse mapper na domain model

## Po stworzeniu

Przypomnij użytkownikowi: uruchom `make builder` aby wygenerować pliki `.freezed.dart` i `.g.dart`.
