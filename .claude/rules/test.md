---
globs: ["**/test/**/*_test.dart", "**/integration_test/**/*.dart"]
---

# Test Rules

## Data layer tests (packages/data/test/)

These are integration tests hitting the real test API.

```dart
void main() {
  late final GetIt getIt;
  late final FeatureRepository repository;

  setUpAll(() async {
    getIt = await injectDependencies();
    HttpOverrides.global = null;
    repository = getIt<FeatureRepository>();
    await authorize();
  });

  tearDown(() async {
    final apiLog = GetIt.instance.get<String>(instanceName: 'ApiLogFilename');
    print('event:attachment:$apiLog');
  });

  test(
    'GET items for user',
    () async {
      testDescription(
        'GIVEN a logged-in user,\n'
        'WHEN getItems is called,\n'
        'THEN it returns a list of items.',
      );

      // GIVEN
      const data = ItemsData(customerId: null);

      // WHEN
      final result = await repository.getItems(data: data);

      // THEN
      expect(result, isA<PaginatedResult<Item>>());
      expect(result.items, isNotEmpty);
    },
  );
}
```

## Widget/golden tests (test/)

Use `testPage()`, `testRoute()`, `captureMultiScreenshots()` from `test/helpers/test_utils.dart`.

## Conventions

- BDD style: `testDescription('GIVEN ...,\nWHEN ...,\nTHEN ...')` 
- Comment sections: `// GIVEN`, `// WHEN`, `// THEN`
- Use `isA<Type>()` matchers
- `setUpAll` for DI, `tearDown` for API log attachment
- Data layer tests always call `authorize()` before authenticated endpoints
- Mocking: `@GenerateNiceMocks` with mockito
- Test names: descriptive, uppercase verb prefix (e.g., `'GET items for user'`)
