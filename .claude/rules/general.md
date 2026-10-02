---
globs: ["**/*.dart"]
---

# General Dart Rules

## Code generation

- Never edit files with suffixes: `.freezed.dart`, `.g.dart`, `.config.dart`, `.module.dart`, `.gen.dart`
- After adding/modifying freezed models, DTOs, or DI registrations, remind the user to run `make b` or `make builder`

## Dependencies

- Domain package must not import Flutter or data package
- Data package imports domain but not the app (lib/)
- App imports both domain and data

## Error handling

- Use `Either<ErrorResult, T>` from fpdart for operation results
- Never use raw try/catch in cubits — rely on `BaseUseCase` wrapping
- Use `Result` enum codes for error categorization

## Imports

Order: `dart:` -> `package:flutter/` -> `package:` (third-party) -> relative imports

## Null safety

- Prefer non-nullable types. Use `?` only when the value is genuinely optional
- Use `??` for defaults, `!` only when null is impossible at that point

## DI

- Use `@injectable` / `@Injectable(as: Interface)` — never manually register in GetIt
- Runtime params use `@factoryParam` in constructor
