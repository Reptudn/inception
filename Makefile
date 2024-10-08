COMPOSE := srcs/docker-compose.yml

volumes:
	mkdir -p srcs/volumes/db_volume
	mkdir -p srcs/volumes/wordpress_volume

delete_vol:
	rm -rf srcs/volumes

run: $(COMPOSE)
	cd srcs && docker-compose up -d

stop: $(COMPOSE)
	cs srcs && docker-compose down

up: run
down: stop
restart: down up

# remove all the containers and images and volumes
purge: $(COMPOSE) delete_vol
	cd srcs && docker-compose down --rmi all --volumes

re: purge all


all: volumes run