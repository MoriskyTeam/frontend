---
name: test-repo
description: Generuje test integracyjny dla repozytorium w warstwie data — prawdziwe wywołania API z testowym kontem, BDD format (GIVEN/WHEN/THEN). Podaj nazwę repozytorium lub feature'u.
argument-hint: "[nazwa repozytorium lub feature'u]"
---

# Test Repository — Dynamic RCB Alerts

Wygeneruj test integracyjny dla repozytorium (prawdziwe API, testowe konto).

## Input

- **Repozytorium**: `$ARGUMENTS` (nazwa repo lub feature'u)

## Proces

### 1. Znajdź repozytorium
Przeszukaj:
- `packages/domain/lib/src/repository/*$ARGUMENTS*` — interfejs
- `packages/data/lib/src/repository/*$ARGUMENTS*` — implementacja

Przeczytaj oba pliki aby poznać dostępne metody.

### 2. Sprawdź istniejące testy
Przeszukaj `packages/data/test/repo/` — może test już istnieje i trzeba go tylko rozszerzyć.

### 3. Przeczytaj setup testowy
Przeczytaj istniejące pliki testowe aby zrozumieć:
- `packages/data/test/test_get_it.dart` — DI setup
- `packages/data/test/utils/const.dart` — test constants
- `packages/data/test/utils/test_description.dart` — helper

### 4. Stwórz plik testowy

**Lokalizacja**: `packages/data/test/repo/{feature}_repository_test.dart`

```dart
import 'dart:io';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../test_get_it.dart';
import '../utils/const.dart';
import '../utils/test_description.dart';

void main() {
  late final GetIt getIt;
  late final {Feature}Repository repository;

  setUpAll(() async {
    getIt = await injectDependencies();
    HttpOverrides.global = null;
    repository = getIt<{Feature}Repository>();
    await authorize();
  });

  tearDown(() async {
    final apiLog = GetIt.instance.get<String>(instanceName: 'ApiLogFilename');
    print('event:attachment:$apiLog');
  });

  test(
    'GET {feature} list',
    () async {
      testDescription(
        'GIVEN authorized user,\n'
        'WHEN get{Feature}List is called,\n'
        'THEN it returns a paginated list of {feature}s.',
      );

      // GIVEN
      const data = {Feature}ListData();

      // WHEN
      final result = await repository.get{Feature}List(data: data);

      // THEN
      expect(result, isA<PaginatedResult<{Feature}>>());
      expect(result.items, isNotEmpty);
    },
  );

  test(
    'GET {feature} details',
    () async {
      testDescription(
        'GIVEN a valid {feature} ID,\n'
        'WHEN get{Feature} is called,\n'
        'THEN it returns {feature} details.',
      );

      // GIVEN
      const entityId = EntityId(/* test ID */);

      // WHEN
      final result = await repository.get{Feature}(entityId);

      // THEN
      expect(result, isA<{Feature}>());
      expect(result.id, isNotNull);
    },
  );

  test(
    'GET {feature} with invalid ID',
    () async {
      testDescription(
        'GIVEN an invalid {feature} ID,\n'
        'WHEN get{Feature} is called,\n'
        'THEN it throws ApiException with 404.',
      );

      // GIVEN
      const entityId = EntityId(id: -1, entityType: EntityType.{type});

      // WHEN & THEN
      expect(
        () => repository.get{Feature}(entityId),
        throwsA(
          isA<ApiException>().having(
            (e) => e.responseCode,
            'response code',
            HttpStatus.notFound,
          ),
        ),
      );
    },
  );
}
```

### 5. Pokrycie

Dla każdej metody repozytorium:
- **Happy path** — poprawne dane -> poprawny wynik
- **Error path** — niepoprawne dane -> odpowiedni wyjątek (401, 404, 422)
- **Edge cases** — puste listy, paginacja, filtry

## Konwencje

- `testDescription()` z BDD: `GIVEN ..., WHEN ..., THEN ...`
- Komentarze: `// GIVEN`, `// WHEN`, `// THEN` w ciele testu
- `setUpAll` z `injectDependencies()` + `authorize()`
- `tearDown` z API log attachment
- Nazwy testów: UPPERCASE verb (GET, POST, CREATE, DELETE)
- Prawdziwe API — testy działają na testowym środowisku
