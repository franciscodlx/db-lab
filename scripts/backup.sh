
#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
source .env

DB="${1:?Uso: backup.sh mysql|postgres|mariadb|mongodb|redis}"
STAMP="$(date +%Y%m%d_%H%M%S)"
DIR="backups/$DB"

mkdir -p "$DIR"

case "$DB" in

 mysql)
   docker compose exec -T mysql sh -c \
     'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --all-databases --single-transaction --routines --triggers --events' \
     | gzip > "$DIR/$STAMP.sql.gz"
   ;;

 postgres)
   docker compose exec -T postgres sh -c \
     'exec pg_dumpall -U "$POSTGRES_USER"' \
     | gzip > "$DIR/$STAMP.sql.gz"
   ;;

 mariadb)
   docker compose exec -T mariadb sh -c \
     'exec mariadb-dump -uroot -p"$MARIADB_ROOT_PASSWORD" --all-databases --single-transaction --routines --events' \
     | gzip > "$DIR/$STAMP.sql.gz"
   ;;

 mongodb)
   docker compose exec -T mongodb sh -c \
     'exec mongodump --username "$MONGO_USER" --password "$MONGO_PASSWORD" --authenticationDatabase admin --archive' \
     | gzip > "$DIR/$STAMP.archive.gz"
   ;;

 redis)
   docker compose exec -T redis redis-cli SAVE
   CONTAINER=$(docker compose ps -q redis)
   docker cp "$CONTAINER:/data/dump.rdb" "$DIR/$STAMP.rdb"
   ;;

 *)
   echo "Motor no soportado"
   exit 1
   ;;
esac

echo "Backup terminado:"
ls -lh "$DIR"
