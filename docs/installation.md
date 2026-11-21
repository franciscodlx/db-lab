# Installation Guide

## Requisitos

- macOS.
- Docker Desktop.
- Docker Compose v2.

## Preparación

cp .env.example .env
chmod 600 .env

Editar credenciales.

## Validación

./scripts/lab validate

## Instalación

./scripts/lab install

## Primer arranque

./scripts/lab up postgres

## Verificación

./scripts/lab health postgres

## Segunda prueba

./scripts/lab up postgres kafka

## Detención

./scripts/lab down kafka
