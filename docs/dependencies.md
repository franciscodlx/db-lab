# Service Dependencies

| Consumer      | Provider | Condition       |
| ------------- | -------- | --------------- |
| phpMyAdmin    | MySQL    | service_healthy |
| Mongo Express | MongoDB  | service_healthy |
| Kafka UI      | Kafka    | service_healthy |

Los siguientes servicios son independientes:

- PostgreSQL.
- MariaDB.
- Redis.
- RabbitMQ.
- MinIO.
- Prometheus.
- Grafana.
- Loki.
- cAdvisor.
- Adminer.
- RedisInsight.

Las dependencias se utilizan exclusivamente
cuando la disponibilidad del proveedor
es obligatoria para iniciar el consumidor.

La relación de conectividad opcional
no implica una dependencia de arranque.
