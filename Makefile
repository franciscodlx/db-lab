
.PHONY: install validate core messaging storage observability tools dev all stop status health monitor postgres mysql redis kafka

install:
	./scripts/lab install

validate:
	./scripts/lab validate

postgres:
	./scripts/lab up postgres

mysql:
	./scripts/lab up mysql

redis:
	./scripts/lab up redis

kafka:
	./scripts/lab up kafka

core:
	./scripts/lab up core

messaging:
	./scripts/lab up messaging

storage:
	./scripts/lab up storage

observability:
	./scripts/lab up observability

tools:
	./scripts/lab up tools

dev:
	./scripts/lab up dev

all:
	./scripts/lab up all

stop:
	./scripts/lab down all

status:
	./scripts/lab status

health:
	./scripts/lab health

monitor:
	./scripts/lab monitor
