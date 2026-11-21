# DB Lab Enterprise

Laboratorio local de infraestructura para desarrollo de
microservicios, sistemas distribuidos y arquitecturas empresariales.

Diseñado para macOS con Docker Desktop, almacenamiento persistente
y administración granular de servicios.

---

## 1. Objetivo

Mantener una infraestructura compartida e independiente
de los proyectos de desarrollo.

Permite iniciar, detener, reiniciar y monitorear:

- Motores de bases de datos.
- Sistemas de mensajería.
- Almacenamiento de objetos.
- Herramientas de observabilidad.
- Herramientas administrativas.

Cada servicio puede administrarse individualmente,
en combinación con otros o mediante grupos funcionales.

---

## 2. Arquitectura

### Databases

- MySQL 8.4
- PostgreSQL 17
- MariaDB 11
- MongoDB 8
- Redis 8

### Messaging

- RabbitMQ 4
- Apache Kafka 4 (KRaft single-node)
- Kafka UI

### Object Storage

- MinIO

### Observability

- Prometheus
- Grafana
- Loki
- cAdvisor

### Administration

- Adminer
- phpMyAdmin
- Mongo Express
- RedisInsight

---

## 3. Requisitos

- macOS
- Docker Desktop
- Docker Compose v2
- 32 GB RAM recomendados
- SSD

---

## 4. Instalación

```bash
cp .env.example .env
chmod 600 .env

# Configurar contraseñas
nano .env

chmod +x scripts/*
./scripts/lab validate
./scripts/lab install
```

---

## 5. Administración individual

Iniciar un servicio:

```bash
./scripts/lab up postgres
```

Iniciar varios:

```bash
./scripts/lab up postgres redis
```

Iniciar tres:

```bash
./scripts/lab up postgres kafka redis
```

Detener uno:

```bash
./scripts/lab down postgres
```

Detener varios:

```bash
./scripts/lab down postgres kafka
```

Reiniciar:

```bash
./scripts/lab restart postgres
```

---

## 6. Administración por capas

### Core

Motores de datos.

```bash
./scripts/lab up core
./scripts/lab down core
```

### Messaging

RabbitMQ, Kafka y Kafka UI.

```bash
./scripts/lab up messaging
./scripts/lab down messaging
```

### Storage

```bash
./scripts/lab up storage
./scripts/lab down storage
```

### Observability

```bash
./scripts/lab up observability
./scripts/lab down observability
```

### Tools

```bash
./scripts/lab up tools
./scripts/lab down tools
```

### Desarrollo

```bash
./scripts/lab up dev
```

### Infraestructura completa

```bash
./scripts/lab up all
```

---

## 7. Dependencias

Las herramientas administrativas pueden iniciar
automáticamente sus proveedores obligatorios.

Ejemplo:

```bash
./scripts/lab up phpmyadmin
```

Comportamiento:

1. Inicia MySQL.
2. Espera el healthcheck de MySQL.
3. Inicia phpMyAdmin.

Las dependencias se declaran mediante depends_on.

Condiciones admitidas:

- service_healthy
- service_started

Las dependencias opcionales no se fuerzan.

---

## 8. Estado y monitoreo

```bash
./scripts/lab status
./scripts/lab status postgres kafka

./scripts/lab health
./scripts/lab health postgres

./scripts/lab monitor

./scripts/lab logs postgres
```

---

## 9. Backups

```bash
./scripts/lab backup mysql
./scripts/lab backup postgres
./scripts/lab backup mariadb
./scripts/lab backup mongodb
./scripts/lab backup redis
```

Restauración:

```bash
./scripts/lab restore postgres backups/postgres/archivo.sql.gz
```

Los backups se almacenan fuera de los volúmenes de los motores.

---

## 10. Networking

Red compartida:

db-lab-network

Desde macOS se utiliza localhost.

Desde contenedores externos conectados a la red:

- postgres:5432
- mysql:3306
- redis:6379
- kafka:9092
- rabbitmq:5672
- mongodb:27017
- minio:9000

---

## 11. Persistencia

Los motores utilizan Docker Named Volumes independientes.

Detener servicios no elimina información.

No utilizar:

```bash
docker compose down -v
```

como operación rutinaria.

---

## 12. Seguridad

- No versionar .env.
- Cambiar credenciales iniciales.
- Publicar puertos únicamente en localhost.
- Crear usuarios por aplicación.
- No utilizar root desde microservicios.
- No reutilizar credenciales en producción.

---

## 13. Limitaciones

- Kafka funciona en un único nodo.
- MinIO es para desarrollo local.
- cAdvisor tiene limitaciones en Docker Desktop.
- La observabilidad requiere exporters específicos.
- Loki requiere un agente de recolección.
- No es una infraestructura de producción HA.

---

## 14. Documentación

Consultar:

- docs/architecture.md
- docs/installation.md
- docs/operations.md
- docs/service-catalog.md
- docs/dependencies.md
- docs/resource-budget.md
- docs/connections.md
- docs/backups.md
- docs/security.md
- docs/troubleshooting.md

Decisiones arquitectónicas:

docs/adr/

---

## 15. Principio arquitectónico

DB Lab es infraestructura compartida.

Los proyectos consumen servicios existentes.
No deben duplicar motores de bases de datos.

Cada servicio se administra independientemente
y los grupos funcionales son atajos operativos.

---

## Estado

Plataforma de desarrollo local.
No certificada para producción.
