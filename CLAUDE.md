# CLAUDE.md — Dynamic RCB Alerts

Working contract for AI agents in this repo. Keep it short, repo-specific, and
executable. Structure and code conventions mirror the sibling `shapely` repo.

## Project Snapshot

**Dynamic RCB Alerts** (working name). Product brief: _TBD — paste here once
shared._

## Tech Stack

- **Flutter `3.41.5` (Dart)** via `.fvmrc` — single codebase **Android, iOS
  and Web**.
- **State management:** Bloc / Cubit (flutter_bloc + bloc_presentation +
  bloc_test + injectable).
- **Backend:** Firebase — Auth, Firestore, Functions, Storage, Remote Config,
  Cloud Messaging, Analytics, Crashlytics (mobile only), App Check (mobile
  only for now; web needs a reCAPTCHA key).
- Lints: `very_good_analysis`. Formatter page width: `80`.

Use `fvm flutter` / `fvm dart` when FVM is installed. The `Makefile` falls back
to plain `flutter` / `dart` if FVM is unavailable.

## Architecture — three-layer clean architecture

Same shape as siblings on Slawek's stack:

- `packages/domain/` — pure Dart domain package. Entities, request models,
  repository interfaces, use cases, base result/error types. **No Flutter
  imports. No `data` imports.**
- `packages/data/` — data implementation. Firebase services (Firestore, Auth,
  Functions, Storage, Remote Config), DTOs, mappers, repository
  implementations, local storage, test hooks. **May
  import `domain` only.**
- `lib/` — Flutter app and presentation layer. DI (get_it + injectable),
  GoRouter routing, theme/design system, feature UIs, shared
  widgets, styleguide, l10n.

## Flavors

Two flavors, one Firebase project (`dynamic-rcb-alerts`) for now:

| Flavor      | Android applicationId             | iOS bundle ID                 |
| ----------- | --------------------------------- | ----------------------------- |
| development | `dev.slavis.dynamicrcbalerts.dev` | `dev.slavis.dynamicrcbalerts` |
| production  | `dev.slavis.dynamicrcbalerts`     | `dev.slavis.dynamicrcbalerts` |

- Entry-points: `lib/main_development.dart`, `lib/main_production.dart`.
- Shared bootstrap: `lib/bootstrap.dart` → `FlavorConfig.init(flavor)` →
  `bootstrapFirebase(flavor)` → `configureDependencies()` → `runApp`.
- Android handles its own per-flavor `google-services.json` via `src/<flavor>/`.
- iOS uses a single bundle ID for both flavors. The Makefile `run-*` /
  `build-ios-*` targets copy the right plist via
  `ios/scripts/swap_google_service_info.sh`.
- Web: `make run-web` (development flavor, Chrome).
- When a separate prod Firebase project is needed, re-run `flutterfire
  configure` for the production flavor only.

Build / generation order is always:

```text
packages/domain -> packages/data -> app root
```

Never edit generated files: `*.freezed.dart`, `*.g.dart`, `*.config.dart`,
`*.module.dart`, `*.gen.dart`. After changing Freezed models, DTOs, injectable
registrations, or generated routes, run `make b` or the narrow package-level
build needed for the change.

## Folder Layout

```text
lib/
├── core/
│   ├── di/             # get_it + injectable
│   ├── firebase/       # Firebase init, App Check, Crashlytics
│   ├── flavor/         # FlavorConfig
│   ├── routing/        # GoRouter
│   └── theme/          # Design tokens (colors, radii, spacing, typography)
├── features/
│   └── {feature}/      # bloc/, widget/, model/, key/, {feature}_page.dart
├── shared/
│   └── widgets/
├── l10n/               # ARB files (en, pl) -> l10n/gen
├── bootstrap.dart
├── main_development.dart
└── main_production.dart
```

## Domain Layer

Use cases:

- Live in `packages/domain/lib/src/usecase/{feature}/`.
- Extend `BaseUseCase<TParam, TResult>` or `BaseUseCaseNoParam<TResult>`.
- Annotated with `@injectable`.
- Inject repositories only.
- Keep `execute()` thin and delegate to repositories.
- Do not catch exceptions in use cases; `BaseUseCase.call()` wraps results in
  `Either<ErrorResult, T>`.

Domain models:

- `@freezed sealed class`.
- Only `.freezed.dart` — no `.g.dart`. Domain models are never serialized.
- Result entities in `packages/domain/lib/src/model/result/{feature}/`.
- Request / use-case params in `packages/domain/lib/src/model/request/`.

Repository interfaces:

- Live in `packages/domain/lib/src/repository/`.
- Return domain models only, never DTOs.
- Prefer named parameters.

## Data Layer

Services (one abstract + one impl per source):

- Live in `packages/data/lib/src/service/{feature}/`.
- Abstract service + `@Injectable(as: ServiceInterface)` impl.
- Firestore/Functions/Auth wrappers live here, not in repositories.
- Return DTOs, not domain models.
- Named parameters.

DTOs:

- Live in `packages/data/lib/src/model/{feature}/`.
- `@freezed sealed class` + `@JsonSerializable(fieldRename: FieldRename.snake)`.
- Both `.freezed.dart` and `.g.dart`. Include `fromJson`.
- Suffix `DTO`.
- API fields `required` but nullable unless the contract is proven stricter.

Mappers:

- Live in `packages/data/lib/src/mapper/{feature}_mappers.dart`.
- Extension methods only.
- `toDomain()` for DTO → domain, `toData()` / `toDTO()` for the other way.
- Handle nullability intentionally with defaults; `!` only when guaranteed.

Repository implementations:

- Live in `packages/data/lib/src/repository/`.
- `@Injectable(as: DomainRepositoryInterface)`.
- Inject services and storage — not app-layer dependencies.
- Convert request → DTO before service call, DTO → domain before returning.

## Presentation Layer

Feature UI under `lib/features/{feature}/`:

```text
feature_name/
  bloc/
    feature_name_cubit.dart
    feature_name_state.dart
  model/
  key/
    feature_name_keys.dart
  feature_name_page.dart
```

Cubit / Notifier rules:

- `Cubit<State>` or `BaseCubit<State>` when `init()` is needed.
- Mix in `BlocPresentationMixin<State, Event>` for one-off navigation / dialog /
  snackbar events.
- `@injectable`.
- Inject use cases — not repositories or services.
- Constructor injection only; no service-locator calls inside cubits.
- Runtime parameters via `@factoryParam`.
- Do not catch exceptions in cubits. Call use cases and fold the `Either`.

State rules:

- `part of` the cubit file.
- `@freezed sealed class`, one factory constructor, `@Default(...)` for every
  field.
- Keep states pure data — put one-off effects in presentation events.

Page rules:

- Outer widget sets up `BlocProvider` / `MultiBlocProvider`.
- Create cubits with `getIt<CubitType>()`.
- `unawaited(cubit.init())` inside the provider `create` callback when needed.
- `HookWidget` when subscribing to presentation streams.
- `BlocBuilder` for reactive UI, `context.read<Cubit>()` for one-time actions.

Navigation: `go_router` / `go_router_builder`. Routes in
`lib/core/routing/routes/`. Regenerate after route changes.

## Commands

The Makefile mirrors siblings:

```bash
make init          # mason, flutter_gen, git hooks
make pub           # pub get for domain, data, app
make builder       # pub get + build_runner in domain -> data -> app order
make b             # build_runner only, in domain -> data -> app order
make lint          # flutter analyze --no-pub --suppress-analytics
make assets        # flutter_gen assets / font constants
make l10n          # flutter gen-l10n
make cleanBuild    # flutter clean + full rebuild
make feature       # mason scaffold; `make feature bloc` for Bloc instead of Cubit
```

Test commands for reliable agent verification:

```bash
fvm flutter test packages/data
fvm flutter test test
fvm flutter test integration_test
```

> `make tests` historically appends `|| true` — **do not** use it as a
> pass/fail gate. Run the explicit `flutter test` invocations above.

## Error Handling

Railway-style `Either<ErrorResult, T>` from `fpdart`.

Expected flow:

```text
DioException | FirebaseException -> ErrorMapper -> ApiException ->
ApiErrorMapper -> Result enum -> BaseUseCase -> Either<ErrorResult, T>
```

Do not introduce raw error paths that bypass this chain unless fixing the
chain itself.

## Testing

BDD-style descriptions:

```dart
testDescription(
  'GIVEN ...,\n'
  'WHEN ...,\n'
  'THEN ...',
);
```

Conventions:

- Data-layer tests in `packages/data/test/` — may hit real Firebase test
  project (use a dedicated test project, never prod).
- App / widget / golden tests in `test/`.
- Integration tests in `integration_test/`.
- Data tests set up DI via `injectDependencies()` and call `authorize()` for
  authenticated endpoints.
- Prefer `bloc_test` + `mockito` for cubit tests.
- Use helpers from `test/helpers/test_utils.dart` for widget / golden tests.

## Local Claude Skills

Repo-local skills under `.claude/skills/` (mirror the sibling Flutter project):

- `/add-model` — add a domain model, DTO, and mapper.
- `/add-usecase` — add a domain use case and repository method.
- `/add-endpoint` — vertical Firebase endpoint slice across service,
  repository, use case, mapper.
- `/analyze-feature` — map an existing feature before modifying it.
- `/check-arch` — check layer boundaries.
- `/build` — run code generation for the right package scope.
- `/test-cubit` — generate cubit tests.
- `/test-repo` — generate data repository tests.
- `/golden-update` — update intentional golden screenshots.
- `/pre-pr` — local pre-PR checklist.

Read `.claude/rules/*.md` when touching matching code — they contain the
detailed examples for cubits, pages, states, DTOs, mappers, services,
repositories, use cases, and tests.

## UI / Design — Impeccable

All UI work goes through the **Impeccable** skill
(`.claude/skills/impeccable`, https://github.com/pbakaus/impeccable):

- `/impeccable init` once the brief lands — writes `PRODUCT.md`.
- `/impeccable shape` before building a new screen, `/impeccable craft` to
  build, `/impeccable critique` / `audit` / `polish` before shipping.
- Durable visual system lives in `DESIGN.md`; theme tokens in
  `lib/core/theme/` must stay in sync with it.

## gstack Workflow

Use gstack for larger work:

- `/office-hours` — shape vague product ideas before code.
- `/autoplan` — run CEO/design/eng plan review before non-trivial work.
- `/plan-eng-review` — lock architecture, data flow, edge cases, tests.
- `/investigate` — debug from root cause; never patch symptoms first.
- `/review` — review branch/diff before PR.
- `/qa` — flow QA for user-facing changes.
- `/ship` — prepare PR after tests/review pass.

Default workflow for non-trivial changes:

```text
read spec section -> understand existing code -> plan smallest coherent slice ->
implement -> regenerate if needed -> lint + tests -> review -> summarize risk
```


For UI changes, include visual verification (screenshot or `/qa`) when
possible.

## Git And PRs

Base branch: `main`.

Branch naming:

- `feature/<short-description>` (or `feature/RCB-XX-description` once an
  issue tracker is wired up)
- `fix/<short-description>`
- `chore/<short-description>`
- `release/X.Y.Z`

Commit message convention:

```text
feat: lowercase present-tense message
fix: lowercase present-tense message
chore: lowercase present-tense message
style: lowercase present-tense message
```

PR title convention (once an issue tracker exists):

```text
RCB-XX: Description
```

Until then, plain `feat: ...` titles are fine.

Do not commit secrets, Firebase service account keys, API logs, generated
build artifacts, or local IDE state. Never rewrite or discard user changes
unless explicitly asked.
