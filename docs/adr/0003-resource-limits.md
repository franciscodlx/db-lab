# ADR-0003: Presupuesto de recursos

- Estado: Aceptado

## Contexto

El laboratorio comparte memoria y CPU
con macOS y aplicaciones de desarrollo.

## Decisión

Cada servicio debe declarar límites
de recursos apropiados para desarrollo.

Los servicios se inician bajo demanda.

## Objetivo

Evitar que la infraestructura completa
consuma recursos cuando no es necesaria.

## Consecuencias

Los límites deben validarse con docker stats.

Los límites no representan reservas de RAM.

El presupuesto total debe considerar
el consumo real de los servicios activos.
