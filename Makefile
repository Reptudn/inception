COMPOSE := docker-compose.yml

make_volumes:
	mkdir -p srcs/volumes
	mkdir -p srcs/volumes/db
	mkdir -p srcs/volumes/wordpress

delete_vol:
	rm -rf srcs/volumes

run: delete_vol make_volumes srcs/$(COMPOSE)
	cd srcs && docker compose -f $(COMPOSE) up -d --remove-orphans --force-recreate

stop: srcs/$(COMPOSE)
	cd srcs && docker compose down

up: run
down: stop
restart: down up

# remove all the containers and images and volumes
purge: srcs/$(COMPOSE) delete_vol
	cd srcs && docker compose -f $(COMPOSE) down --rmi all --volumes
	docker network prune -f

fclean: delete_vol purge

re: purge all

all: delete_vol make_volumes run

.PHONY: all down up run stop purge fclean re delete_vol