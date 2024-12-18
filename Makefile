COMPOSE := docker-compose.yml

all:
	cd srcs && docker compose -p inception -f $(COMPOSE) up -d

stop: srcs/$(COMPOSE)
	cd srcs && docker compose -p inception down

up: run
down: stop
restart: down up

fclean: srcs/$(COMPOSE)
	cd srcs && docker compose -p inception -f $(COMPOSE) down --rmi all --volumes
	docker network prune -f

re: fclean
	cd srcs && docker compose -p inception -f $(COMPOSE) up -d --remove-orphans --force-recreate

list:
	cd srcs && docker compose -p inception ps

.PHONY: all down up run stop purge fclean re