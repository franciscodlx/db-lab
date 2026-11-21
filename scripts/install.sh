#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "DB LAB ENTERPRISE - macOS"

if ! command -v docker >/dev/null 2>&1; then
  echo "Instala Docker Desktop para macOS."
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "Inicia Docker Desktop."
  exit 1
fi

mkdir -p backups/{mysql,postgres,mariadb,mongodb,redis}
mkdir -p docs/adr
mkdir -p examples/{nodejs,python,java,dotnet}

if [[ ! -f .env ]]; then
  cp .env.example .env
  chmod 600 .env
  echo "Configura .env antes de continuar."
  exit 1
fi

chmod +x scripts/*

docker compose config --quiet

echo "Descargando imagenes..."
docker compose --profile db pull
docker compose --profile messaging pull
docker compose --profile storage pull
docker compose --profile observability pull
docker compose --profile tools pull

echo "Instalacion terminada."
echo "Inicia con: ./scripts/lab up core"