
#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
source .env

DB="${1:?Motor requerido}"
FILE="${2:?Archivo requerido}"

[[ -f "$FILE" ]] || {
  echo "Backup no encontrado"
  exit 1
}

echo "ATENCION: esta operacion puede reemplazar datos."
echo "Motor: $DB"
echo "Archivo: $FILE"

read -r -p "Escribe RESTORE para confirmar: " ANSWER
[[ "$ANSWER" == "RESTORE" ]] || exit 1

case "$DB" in
 mysql)
   gzip -dc "$FILE" | docker compose exec -T mysql \
     sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"'
   ;;

 postgres)
   gzip -dc "$FILE" | docker compose exec -T postgres \
     sh -c 'exec psql -U "$POSTGRES_USER" -d postgres'
   ;;

 mariadb)
   gzip -dc "$FILE" | docker compose exec -T mariadb \
     sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"'
   ;;

 mongodb)
   gzip -dc "$FILE" | docker compose exec -T mongodb sh -c \
     'exec mongorestore --username "$MONGO_USER" --password "$MONGO_PASSWORD" --authenticationDatabase admin --archive --drop'
   ;;

 redis)
   echo "Redis requiere restauracion del archivo RDB."
   echo "Deten el servicio, respalda su volumen y reemplaza dump.rdb."
   exit 2
   ;;

 *)
   echo "Motor no soportado"
   exit 1
   ;;
esac

echo "Restauracion terminada."
