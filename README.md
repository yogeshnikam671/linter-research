# Linter Comparison Demo

This repo is now organized around one scenario per folder under `scenarios/`. Each scenario contains:

- `openapi.yaml`: minimal OpenAPI document for one linter edge case
- `expected.yaml`: intent, hypothesis, and verification status

## Layout

```text
scenarios/
  manifest.yaml
  <scenario-slug>/
    openapi.yaml
    expected.yaml
linters/
  spectral/
  redocly/
  vacuum/
  specmatic/
scripts/
  run-scenario.sh
  run-all.sh
results/
```

## Run One Scenario

Example:

```bash
./scripts/run-scenario.sh scenarios/ambiguous-interpolated-paths
```

This runs:

- Spectral with `linters/spectral/base.yaml`
- Redocly with `linters/redocly/base.yaml`
- Vacuum with `--hard-mode`
- Specmatic linter with default output format

Specmatic command intentionally does **not** pass `--format`, so output stays in default JSON form:

```bash
docker run --rm -v "$(pwd):/usr/src/app" -w /usr/src/app specmatic/enterprise lint scenarios/ambiguous-interpolated-paths/openapi.yaml
```

Results land in `results/<scenario>/`.

## Run All Scenarios

```bash
./scripts/run-all.sh
```

`scenarios/manifest.yaml` is source of truth for what is implemented now vs still backlog from `draft-notes.txt`.

## Scope

Current pass focuses on phase-1 cases from `draft-notes.txt`: path ambiguity, response semantics, discriminator and composition issues, media-type/header conflicts, auth mismatches, and query-serialization traps.

Custom Spectral/Redocly/Vacuum semantic overlays are not implemented yet. Repo now has stable scenario fixtures and runner plumbing so those can be added without reshaping demo again.
