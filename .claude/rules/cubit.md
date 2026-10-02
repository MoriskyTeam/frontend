---
globs: ["**/bloc/*_cubit.dart"]
---

# Cubit Rules

## Structure

- Extend `Cubit<State>` (or `BaseCubit<State>` if `init()` is needed)
- Mix in `BlocPresentationMixin<State, Event>` for one-off side effects (dialogs, navigation, snackbars)
- Annotate with `@injectable`
- Use `@factoryParam` for runtime parameters passed via `getIt(param1:, param2:)`
- Prefix private dependencies with `_`

## Part files

```dart
part 'feature_name_cubit.freezed.dart';
part 'feature_name_state.dart';
```

## Emitting state

- Use `emit(state.copyWith(...))` to update state
- Use `emitPresentation(Event)` for one-off events — never put navigation/dialog triggers in state

## Error handling

- Call use cases and fold the `Either` result:
  ```dart
  final result = await _useCase(param);
  result.fold(
    (error) => emitPresentation(ErrorOccurredEvent(error)),
    (value) => emit(state.copyWith(data: value)),
  );
  ```
- Never catch exceptions directly — `BaseUseCase` handles that

## Dependencies

- Inject use cases, not repositories directly
- Constructor injection only — no service locators inside the cubit
