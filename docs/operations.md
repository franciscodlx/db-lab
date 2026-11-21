# Operations Manual

## Arranque individual

./scripts/lab up postgres

## Arranque combinado

./scripts/lab up postgres kafka redis

## Arranque por capas

./scripts/lab up core
./scripts/lab up messaging
./scripts/lab up storage
./scripts/lab up observability
./scripts/lab up tools

## Desarrollo

./scripts/lab up dev

## Todo

./scripts/lab up all

## Detención individual

./scripts/lab down postgres

## Detención múltiple

./scripts/lab down postgres kafka

## Detención por grupos

./scripts/lab down core
./scripts/lab down messaging

## Detención total

./scripts/lab down all

## Reinicio

./scripts/lab restart postgres

## Estado

./scripts/lab status

## Salud

./scripts/lab health

## Logs

./scripts/lab logs postgres

## Recursos

./scripts/lab monitor

## Persistencia

La detención no elimina volúmenes.

No ejecutar down -v como rutina.
