# ADR-0005: Observabilidad local

- Estado: Aceptado

## Decisión

Utilizar:

- Prometheus.
- Grafana.
- Loki.
- cAdvisor.

Los componentes de observabilidad
pueden iniciarse independientemente.

## Instrumentación

Prometheus necesita exporters para obtener
métricas internas de cada motor.

Loki necesita agentes de recolección.

cAdvisor mide contenedores, con limitaciones
en Docker Desktop para macOS.

## Consecuencias

La observabilidad puede habilitarse
solamente cuando sea necesaria.

## Logging Architecture

Se adopta Grafana Alloy como agente de recolección
de logs de contenedores Docker.

Pipeline:

Docker Containers
|
v
Grafana Alloy
|
v
Grafana Loki
|
v
Grafana

## Retention

Loki conservará logs durante 168 horas.

La retención se administra mediante Compactor.

## Storage

Almacenamiento local mediante Docker Named Volume.

## Security

Alloy requiere acceso al Docker socket para
descubrir y recolectar logs de contenedores.

Este acceso se considera privilegiado.

## Operational Groups

Loki y Alloy forman parte de observability.

Ambos también pueden iniciarse individualmente.

## Limitations

No es una arquitectura distribuida ni HA.
La persistencia local no sustituye backups externos.
