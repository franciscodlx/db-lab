# ADR-0002: Persistencia mediante Docker Volumes

- Estado: Aceptado

## Contexto

Los datos deben sobrevivir al ciclo de vida
de los contenedores.

## Decisión

Cada motor utilizará un volumen independiente.

## Reglas

- stop no elimina datos.
- restart no elimina datos.
- down mediante lab detiene servicios.
- Los backups se guardan fuera de los volúmenes.
- La eliminación de volúmenes requiere
  una operación explícita y confirmada.

## Restricción

No utilizar docker compose down -v
como operación normal.

## Consecuencias

Los servicios pueden iniciarse y detenerse
individualmente sin perder persistencia.
