FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

COPY redis.conf /etc/redis/redis.conf

ENTRYPOINT [ "redis-server", "/etc/redis/redis.conf" ]