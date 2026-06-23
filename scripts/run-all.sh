#!/usr/bin/env bash

set -u

status=0

for scenario_dir in scenarios/*; do
  if [ -d "$scenario_dir" ] && [ -f "$scenario_dir/openapi.yaml" ]; then
    ./scripts/run-scenario.sh "$scenario_dir" || status=$?
  fi
done

exit "$status"
