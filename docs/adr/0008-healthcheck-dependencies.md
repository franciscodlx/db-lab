# ADR-0008: Dependencias saludables

- Estado: Aceptado

## Contexto

Un contenedor iniciado no necesariamente
está preparado para recibir conexiones.

## Decisión

Utilizar depends_on con condiciones explícitas.

service_healthy:
Esperar disponibilidad comprobada.

service_started:
Esperar únicamente el inicio del proveedor.

Sin dependencia:
Para integraciones opcionales.

## Restricciones

Todo proveedor requerido mediante
service_healthy debe implementar
un healthcheck funcional.

## Consecuencias

Inicialización predecible y reducción
de errores por condiciones de carrera.
