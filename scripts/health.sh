#!/usr/bin/env bash
set -Eeuo pipefail

docker ps -a \
  --filter "name=db-lab" \
  --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo
echo "=== HEALTH DETAILS ==="

for id in $(docker ps -q --filter "name=db-lab"); do
  docker inspect \
    --format '{{.Name}} {{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' \
    "$id"
done