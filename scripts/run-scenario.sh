#!/usr/bin/env bash

set -u

if [ "$#" -ne 1 ]; then
  echo "usage: $0 scenarios/<scenario-slug>" >&2
  exit 1
fi

scenario_dir="$1"
spec_file="$scenario_dir/openapi.yaml"

if [ ! -f "$spec_file" ]; then
  echo "missing spec file: $spec_file" >&2
  exit 1
fi

scenario_slug="$(basename "$scenario_dir")"
results_dir="results/$scenario_slug"

mkdir -p "$results_dir"

echo "running spectral for $scenario_slug"
npx @stoplight/spectral lint --ruleset linters/spectral/base.yaml "$spec_file" \
  >"$results_dir/spectral.txt" 2>&1 || true

echo "running redocly for $scenario_slug"
npx @redocly/cli lint --config linters/redocly/base.yaml "$spec_file" --format stylish \
  >"$results_dir/redocly.txt" 2>&1 || true

echo "running vacuum for $scenario_slug"
docker run --rm -v "$(pwd):/work" dshanley/vacuum lint --hard-mode "/work/$spec_file" \
  >"$results_dir/vacuum.txt" 2>&1 || true

echo "running specmatic for $scenario_slug"
docker run --rm -v "$(pwd):/usr/src/app" -w /usr/src/app specmatic/enterprise lint "$spec_file" \
  >"$results_dir/specmatic.json" 2>&1 || true

echo "done: $results_dir"
