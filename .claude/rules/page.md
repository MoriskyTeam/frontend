---
globs: ["**/feature/**/*_page.dart"]
---

# Page Rules

## Structure

A page file typically has two classes:

1. **Outer widget** (`StatelessWidget`) — sets up `BlocProvider`
2. **Inner core** (`HookWidget` or `StatelessWidget`) — consumes the cubit

```dart
class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<FeatureCubit>();
        unawaited(cubit.init());
        return cubit;
      },
      child: const _FeaturePageCore(),
    );
  }
}

class _FeaturePageCore extends HookWidget {
  const _FeaturePageCore();

  @override
  Widget build(BuildContext context) {
    useOnStreamChange<ErrorOccurredEvent>(
      context.read<FeatureCubit>().presentation,
      onData: (event) => event.result.handleDefault(buildContext: context),
    );

    return BlocBuilder<FeatureCubit, FeatureState>(
      builder: (_, state) => _FeaturePageBody(state),
    );
  }
}
```

## Conventions

- Use `getIt<CubitType>()` to create cubits — never instantiate directly
- Call `unawaited(cubit.init())` in the `create` callback
- Use `HookWidget` when you need `useOnStreamChange` for presentation events
- Use `BlocBuilder` for reactive UI, `context.read<Cubit>()` for one-time access
- Use `buildWhen:` to optimize rebuilds where possible
- For multiple cubits, use `MultiBlocProvider`
- Extract body into private `_FeaturePageBody` or `_FeaturePageCore` widgets
