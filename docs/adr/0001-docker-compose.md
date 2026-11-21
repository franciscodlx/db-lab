# ADR-0001: Docker Compose como plataforma local

- Estado: Aceptado
- Fecha original: 2026-11-09

## Contexto

Se requiere infraestructura local reproducible,
independiente de los proyectos consumidores.

## Decisión

Docker Compose será la plataforma de ejecución.

La selección de servicios será administrada
por scripts/lab.

No se utilizarán profiles como mecanismo principal
de selección de servicios.

## Alternativas

- Instalaciones nativas.
- Kubernetes local.
- Docker Compose.

## Consecuencias positivas

- Configuración declarativa.
- Administración granular.
- Arranque selectivo.
- Persistencia independiente.
- Portabilidad.

## Consecuencias negativas

- Dependencia de Docker Desktop.
- Limitaciones de virtualización.
- No proporciona HA.

## Evolución

La administración por capas se conserva
como una abstracción del CLI.

Los servicios pueden iniciarse individualmente.
