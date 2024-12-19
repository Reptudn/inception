COMPOSE := docker-compose.yml

all: up

check-env:
	@echo "ℹ️  Checking environment variables..."
	@mkdir -p /home/$(USER)/data
	@cd srcs && chmod +x check_env.sh && ./check_env.sh

up: check-env srcs/$(COMPOSE)
	@cd srcs && docker compose -p inception -f $(COMPOSE) up -d

down: srcs/$(COMPOSE)
	@cd srcs && docker compose -p inception down

restart: down up

fclean: srcs/$(COMPOSE)
	@cd srcs && docker compose -p inception -f $(COMPOSE) down --rmi all --volumes
	@docker network prune -f
	@rm -rf /home/$(USER)/data

re: fclean check-env srcs/$(COMPOSE)
	@cd srcs && docker compose -p inception -f $(COMPOSE) up -d --remove-orphans --force-recreate

list:
	@cd srcs && docker compose -p inception ps

eval-clean:
	@docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null

.PHONY: all down up run stop purge fclean re