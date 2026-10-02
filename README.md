# Dynamic RCB Alerts

> Working name.

See [`CLAUDE.md`](./CLAUDE.md) for the working contract.

## Tech

- Flutter `3.41.5` (pinned via `.fvmrc`) — Android, iOS, Web
- State: `flutter_bloc` (Cubit) + `bloc_presentation`
- DI: `get_it` + `injectable`
- Routing: `go_router`
- Models / serialization: `freezed` + `json_serializable`
- Functional: `fpdart`
- Backend: Firebase (`dynamic-rcb-alerts`)

Three-layer clean architecture:

```text
packages/domain  →  packages/data  →  lib/   (app)
```

## Quickstart

```bash
fvm install         # if 3.41.5 isn't installed yet
make pub            # pub get all three packages
make b              # codegen (domain → data → app)

make run-dev        # run dev flavor (mobile)
make run-prod       # run prod flavor (mobile)
make run-web        # run dev flavor in Chrome
```

## Testing

```bash
make test-data
make test-app
```

Do not use `make tests` as a pass/fail gate — it suppresses failures.
