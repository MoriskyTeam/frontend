---
globs: ["packages/data/**/mapper/**/*.dart"]
---

# Mapper Rules

## Pattern — Extension Methods

```dart
extension FeatureDTOMapper on FeatureDTO {
  Feature toDomain() => Feature(
    id: id!,
    name: name ?? '',
    createdAt: createdAt,
  );
}

extension FeatureDataMapper on FeatureData {
  FeatureDataDTO toData() => FeatureDataDTO(
    name: name,
    description: description,
  );
}
```

## Conventions

- Use extension methods, not standalone functions or classes
- Naming: `extension {Type}Mapper on {SourceType}`
- Method names: `toDomain()` (DTO -> domain), `toData()` / `toDTO()` (domain -> DTO)
- Handle nullability with `??` defaults or `!` when the field is guaranteed
- For enum/string conversions, use switch expressions:
  ```dart
  extension StatusMapper on String? {
    Status toStatus() => switch (this?.toLowerCase()) {
      'open' => Status.open,
      'closed' => Status.closed,
      _ => Status.unknown,
    };
  }
  ```
- Chain mappers for nested objects: `site?.toDomain()`
- Place in `packages/data/lib/src/mapper/{feature}_mappers.dart`
- One mapper file per feature area, may contain multiple extensions
