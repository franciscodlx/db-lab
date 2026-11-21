# DB Lab Service Catalog

| Grupo         | Servicios                                        |
| ------------- | ------------------------------------------------ |
| Core          | mysql, postgres, mariadb, mongodb, redis         |
| Messaging     | rabbitmq, kafka, kafka-ui                        |
| Storage       | minio                                            |
| Observability | prometheus, grafana, loki, cadvisor              |
| Tools         | adminer, phpmyadmin, mongo-express, redisinsight |

## Individual

./scripts/lab up postgres
./scripts/lab up redis
./scripts/lab up kafka

## Combinado

./scripts/lab up postgres redis kafka

## Por grupo

./scripts/lab up core
./scripts/lab up messaging
./scripts/lab up observability

## Completo

./scripts/lab up all
