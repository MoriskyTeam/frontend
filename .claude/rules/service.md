---
globs: ["packages/data/**/service/**/*.dart"]
---

# Service Rules

## Interface (abstract class)

```dart
abstract class FeatureService {
  Future<FeatureDTO> getFeature({
    required int featureId,
  });

  Future<PaginatedResultDTO<FeatureDTO>> getFeatures({
    required FeatureFilterDTO filterDTO,
  });

  Future<FeatureDTO> createFeature({
    required FeatureDataDTO data,
  });
}
```

## Implementation

- Annotate with `@Injectable(as: ServiceInterface)`
- Inject `ApiClient` for HTTP calls
- Use `ApiClient` generic methods: `get<T, TJson>()`, `post<T, TJson>()`, `put<T, TJson>()`
- Pass type-safe mapper functions for response parsing

## Conventions

- Abstract service in `packages/data/lib/src/service/{feature}/`
- Implementation in same directory as `{feature}_service_impl.dart`
- Return DTOs, not domain models
- Use named parameters
- Support progress callbacks for uploads: `void Function(int, int)? onSendProgress`
