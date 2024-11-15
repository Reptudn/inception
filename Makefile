COMPOSE := docker-compose.yml

make_volumes:
	mkdir -p srcs/volumes/db
	mkdir -p srcs/volumes/wordpress

clean_volumes:
	rm -rf srcs/volumes/db
	rm -rf srcs/volumes/wordpress
	rm -rf srcs/volumes

run: clean_volumes make_volumes srcs/$(COMPOSE)
	cd srcs && docker compose -f $(COMPOSE) up -d --remove-orphans --force-recreate

stop: srcs/$(COMPOSE)
	cd srcs && docker compose down

up: run
down: stop
restart: down up

# remove all the containers and images and volumes
purge: srcs/$(COMPOSE) clean_volumes
	cd srcs && docker compose -f $(COMPOSE) down --rmi all --volumes
	docker network prune -f

fclean: clean_volumes purge

re: purge all

all: clean_volumes make_volumes run

.PHONY: all down up run stop purge fclean re clean_volumes