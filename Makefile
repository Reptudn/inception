COMPOSE := docker-compose.yml

all:
	cd srcs && docker compose -f $(COMPOSE) up -d

stop: srcs/$(COMPOSE)
	cd srcs && docker compose down

up: run
down: stop
restart: down up

# remove all the containers and images and volumes
fclean: srcs/$(COMPOSE)
	cd srcs && docker compose -f $(COMPOSE) down --rmi all --volumes
	docker network prune -f

re: fclean
	cd srcs && docker compose -f $(COMPOSE) up -d --remove-orphans --force-recreate

.PHONY: all down up run stop purge fclean re