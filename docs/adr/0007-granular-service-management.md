# ADR-0007: Administración granular de servicios

- Estado: Aceptado
- Fecha: 2026-11-09

## Contexto

El laboratorio necesita administrar servicios
individuales y combinaciones arbitrarias.

## Decisión

Implementar scripts/lab como interfaz única.

Se soportan:

- Servicios individuales.
- Múltiples servicios.
- Grupos funcionales.
- Conjuntos completos.

## Ejemplos

./scripts/lab up postgres
./scripts/lab up postgres kafka
./scripts/lab up core
./scripts/lab up messaging
./scripts/lab up all

## Restricciones

No iniciar servicios innecesarios.

No detener servicios no solicitados.

No eliminar volúmenes.

## Consecuencias

Mayor flexibilidad y menor consumo
de recursos locales.
