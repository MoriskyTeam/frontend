---
globs: ["packages/data/**/model/**/*.dart"]
---

# DTO Rules

## Structure

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_dto.freezed.dart';
part 'feature_dto.g.dart';

@freezed
sealed class FeatureDTO with _$FeatureDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeatureDTO({
    required int? id,
    required String? name,
    required DateTime? createdAt,
  }) = _FeatureDTO;

  factory FeatureDTO.fromJson(Map<String, dynamic> json) =>
      _$FeatureDTOFromJson(json);
}
```

## Conventions

- Always `@freezed` sealed class with `_$ClassName` mixin
- Use `@JsonSerializable(fieldRename: FieldRename.snake)` on the factory constructor
- All fields `required` but nullable (`Type?`) — API responses can omit fields
- Include both `.freezed.dart` and `.g.dart` part files
- Include `fromJson` factory for deserialization
- Suffix class names with `DTO` (e.g., `PostDTO`, `UserProfileDTO`)
- Place in `packages/data/lib/src/model/{feature}/`
