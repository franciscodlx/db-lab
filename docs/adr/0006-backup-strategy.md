# ADR-0006: Estrategia de backups

- Estado: Aceptado

## Decisión

Administrar backups por motor.

Herramientas:

- mysqldump.
- pg_dumpall.
- mariadb-dump.
- mongodump.
- Redis RDB.

## Reglas

- Los backups no dependen de los grupos.
- Cada motor puede respaldarse individualmente.
- La restauración requiere confirmación.
- Las restauraciones se prueban en entornos aislados.
- Los backups importantes deben copiarse
  fuera del equipo local.

## Consecuencias

La administración de backups es independiente
del arranque y detención de servicios.
