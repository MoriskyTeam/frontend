---
globs: ["packages/domain/**/usecase/**/*.dart"]
---

# Use Case Rules

## Structure

```dart
@injectable
class DoSomethingUseCase extends BaseUseCase<ParamType, ResultType> {
  DoSomethingUseCase(this._repository);

  final SomeRepository _repository;

  @override
  Future<ResultType> execute(ParamType param) =>
      _repository.doSomething(param);
}
```

## Conventions

- One use case per file, one public method (`execute`)
- Extend `BaseUseCase<TParam, TResult>` (with params) or `BaseUseCaseNoParam<TResult>` (no params)
- Annotate with `@injectable`
- Inject repositories via constructor, not services or DAOs
- Keep `execute()` thin — delegate to the repository
- Never catch exceptions — `BaseUseCase.call()` wraps everything in `Either<ErrorResult, T>`
- Use case names follow the pattern: `VerbNounUseCase` (e.g., `GetFeedUseCase`, `CreatePostUseCase`)
- Place in `packages/domain/lib/src/usecase/{feature}/`
