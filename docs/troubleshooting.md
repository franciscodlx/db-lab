# Troubleshooting

## Servicio no inicia

./scripts/lab logs postgres

## Healthcheck fallido

./scripts/lab health postgres

## Puerto ocupado

lsof -i :5432

## Dependencia no saludable

Comprobar el proveedor antes del consumidor.

Ejemplo:

./scripts/lab health mysql
./scripts/lab logs mysql

## Herramienta sin conexión

Verificar que su proveedor esté activo.

## Datos no aparecen

Comprobar Docker Named Volumes.

## Recursos insuficientes

./scripts/lab monitor
