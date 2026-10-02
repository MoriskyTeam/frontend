---
globs: ["**/bloc/*_state.dart"]
---

# State Rules

## Structure

State files are `part of` the cubit file — never standalone.

```dart
part of 'feature_name_cubit.dart';

@freezed
sealed class FeatureNameState with _$FeatureNameState {
  const factory FeatureNameState({
    @Default(LoadingStatus.initial) LoadingStatus loadingStatus,
    @Default([]) List<Item> items,
    @Default(null) Pagination? pagination,
  }) = _FeatureNameState;
}
```

## Conventions

- Always `@freezed` sealed class
- Single factory constructor with `@Default()` for every field
- Use `LoadingStatus` enum for async state tracking (`initial`, `loading`, `loaded`, `error`)
- Nullable fields use `@Default(null)`
- List fields default to `@Default([])`
- No methods on state classes — keep them pure data
- The private implementation class is `_FeatureNameState`
