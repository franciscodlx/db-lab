#!/usr/bin/env bash
set -Eeuo pipefail

echo "=== DB LAB RESOURCE MONITOR ==="

docker stats --no-stream \
  --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"

echo
docker system df

echo
df -h "$HOME"

echo
memory_pressure