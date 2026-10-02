---
globs: ["packages/domain/**/repository/**/*.dart", "packages/data/**/repository/**/*.dart"]
---

# Repository Rules

## Domain layer — Interface

```dart
abstract class FeatureRepository {
  Future<ResultType> doSomething({required ParamType param});
  Future<List<Item>> getItems({required ItemsData data});
}
```

- Abstract class in `packages/domain/lib/src/repository/`
- Returns domain models only — never DTOs
- Use named parameters for clarity

## Data layer — Implementation

```dart
@Injectable(as: FeatureRepository)
class FeatureRepositoryImpl extends FeatureRepository {
  FeatureRepositoryImpl(this._service, this._storage);

  final FeatureService _service;
  final StorageDAO _storage;

  @override
  Future<ResultType> doSomething({required ParamType param}) async {
    final dto = await _service.doSomething(
      data: param.toData(),
    );
    return dto.toDomain();
  }
}
```

- Annotate with `@Injectable(as: InterfaceType)`
- Place in `packages/data/lib/src/repository/`
- Inject services and storage DAO
- Convert domain params -> DTOs via mapper extensions (`.toData()`, `.toDTO()`)
- Convert DTOs -> domain models via mapper extensions (`.toDomain()`)
