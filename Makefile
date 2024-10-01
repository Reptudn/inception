
COMPOSE := "requirements/docker-compose.yml"

run: $(COMPOSE)
	docker-compose up -d --build

stop: $(COMPOSE)
	docker-compose down

# remove all the containers aind images and volumes
purge:
	docker-compose down --rmi all --volumes


.PHONY