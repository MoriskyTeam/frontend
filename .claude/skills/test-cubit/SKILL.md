---
name: test-cubit
description: Generuje kompletne testy jednostkowe dla wskazanego cubita — mockito mocks, bloc_test, Either happy/error path, presentation events. Podaj ścieżkę do cubita lub nazwę feature'u.
argument-hint: "[ścieżka do cubita lub nazwa feature'u]"
---

# Test Cubit — Dynamic RCB Alerts

Wygeneruj kompletne testy jednostkowe dla cubita.

## Input

- **Cubit**: `$ARGUMENTS` (ścieżka do pliku lub nazwa feature'u do wyszukania)

## Proces

### 1. Znajdź i przeczytaj cubit
Jeśli podano nazwę feature'u — znajdź cubit:
```
lib/ui/feature/**/$ARGUMENTS*/**/*_cubit.dart
```
Przeczytaj plik cubita i plik stanu.

### 2. Zidentyfikuj zależności
Wylistuj:
- Injektowane use case'y -> do zamockowania
- Factory params -> do podania w setUp
- Presentation event types -> do weryfikacji

### 3. Przeczytaj modele
Przeczytaj domain models i stany używane przez cubit — potrzebne do fixture'ów w testach.

### 4. Stwórz plik testowy

**Lokalizacja**: `test/ui/feature/{feature_path}/bloc/{cubit_name}_test.dart`

**Struktura**:
```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// ... domain imports for models, use cases

@GenerateNiceMocks([
  MockSpec<UseCase1>(),
  MockSpec<UseCase2>(),
])
import '{cubit_name}_test.mocks.dart';

void main() {
  late {CubitName} cubit;
  late MockUseCase1 mockUseCase1;

  setUp(() {
    mockUseCase1 = MockUseCase1();
    cubit = {CubitName}(
      mockUseCase1,
      // factoryParams...
    );
  });

  tearDown(() => cubit.close());

  group('init', () {
    // Fixtures
    final items = [/* test data */];

    blocTest<{CubitName}, {StateName}>(
      'emits loaded state when data fetched successfully',
      build: () {
        when(mockUseCase1(any))
            .thenAnswer((_) async => Right(items));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const {StateName}(loadingStatus: LoadingStatus.loading),
        {StateName}(loadingStatus: LoadingStatus.loaded, items: items),
      ],
    );

    blocTest<{CubitName}, {StateName}>(
      'emits error and presentation event when use case fails',
      build: () {
        when(mockUseCase1(any))
            .thenAnswer((_) async => Left(
              UnknownError(error: Exception('test')),
            ));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const {StateName}(loadingStatus: LoadingStatus.loading),
        const {StateName}(loadingStatus: LoadingStatus.error),
      ],
      verify: (_) {
        // Verify presentation event was emitted if applicable
      },
    );
  });

  // Group per public method
  group('{methodName}', () {
    // ... tests for each public method
  });
}
```

### 5. Pokrycie

Dla każdej publicznej metody cubita:
- **Happy path** — use case zwraca `Right(value)` -> stan się aktualizuje
- **Error path** — use case zwraca `Left(error)` -> `LoadingStatus.error` + presentation event
- **Edge cases** — puste listy, null params, paginacja

## Po stworzeniu

Przypomnij:
1. `make b` — wygeneruje `.mocks.dart` (build_runner + mockito)
2. `flutter test test/ui/feature/{path}/{cubit_name}_test.dart` — uruchom test
