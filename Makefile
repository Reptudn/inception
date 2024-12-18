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

# remove all the containers and images and volumes accoring to the eval sheet
eval-clean:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

list:
	docker compose -p inception ps

.PHONY: all down up run stop purge fclean re