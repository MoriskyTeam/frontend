---
globs: ["packages/domain/**/model/**/*.dart"]
---

# Domain Model Rules

## Structure

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature.freezed.dart';

@freezed
sealed class Feature with _$Feature {
  const factory Feature({
    required int id,
    required String name,
    required DateTime? createdAt,
    required FeatureStatus status,
  }) = _Feature;

  const Feature._();  // only if adding custom getters

  String get displayName => '$name (#$id)';
}
```

## Conventions

- Always `@freezed` sealed class
- Only `.freezed.dart` part file (no `.g.dart` — domain models don't serialize)
- Use non-nullable types where the field is guaranteed
- Add `const Feature._();` only when defining custom getters or methods
- No JSON serialization in domain models — that belongs in DTOs
- Place in `packages/domain/lib/src/model/result/{feature}/`
- Request models (use case params) go in `packages/domain/lib/src/model/request/`
