# ADR-0004: Red compartida

- Estado: Aceptado

## Contexto

Los proyectos necesitan consumir
infraestructura centralizada.

## Decisión

Utilizar db-lab-network.

Los servicios se comunican mediante
nombres DNS de Docker.

Las aplicaciones locales utilizan localhost.

## Consecuencias

No duplicar bases de datos por proyecto.

Los proyectos externos pueden conectarse
a la red compartida.

La red no implica que todos los servicios
estén encendidos.
