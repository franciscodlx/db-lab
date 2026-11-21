# ADR-0009: Grupos funcionales

- Estado: Aceptado

## Contexto

La administración individual no debe
eliminar la facilidad de los comandos anteriores.

## Decisión

Conservar grupos:

- core
- databases
- messaging
- storage
- observability
- tools
- dev
- all
- full

Los grupos son alias de una lista de servicios.

No representan dependencias automáticas.

## Consecuencias

Se conserva compatibilidad operativa
con la interfaz anterior.
