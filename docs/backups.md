# Backup Operations

## Backup individual

./scripts/lab backup postgres

## Backup de otros motores

./scripts/lab backup mysql
./scripts/lab backup mariadb
./scripts/lab backup mongodb
./scripts/lab backup redis

## Restore

./scripts/lab restore postgres archivo.sql.gz

## Política

Los backups son independientes
de los grupos de arranque.

Las restauraciones requieren confirmación.

Los archivos deben verificarse
y probarse en instancias aisladas.
