# DB Lab Enterprise Architecture

## Principios

1. Infraestructura centralizada.
2. Servicios independientes.
3. Administración granular.
4. Persistencia independiente.
5. Recursos limitados.
6. Conexiones compartidas.
7. Dependencias explícitas.

## Capas

### Core

MySQL, PostgreSQL, MariaDB, MongoDB, Redis.

### Messaging

RabbitMQ, Kafka, Kafka UI.

### Storage

MinIO.

### Observability

Prometheus, Grafana, Loki, cAdvisor.

### Tools

Adminer, phpMyAdmin, Mongo Express, RedisInsight.

## Modos de ejecución

Individual:
./scripts/lab up postgres

Combinado:
./scripts/lab up postgres redis kafka

Por grupo:
./scripts/lab up core

Completo:
./scripts/lab up all

## Dependencias

Las dependencias obligatorias se declaran
en docker-compose.yml.

Se utilizan healthchecks para garantizar
la disponibilidad del proveedor.

## Networking

db-lab-network.

## Persistence

Docker Named Volumes.

## Resource Management

Inicio bajo demanda y límites por servicio.
