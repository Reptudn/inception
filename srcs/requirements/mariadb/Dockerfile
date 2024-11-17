FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/start_mariadb.sh /
RUN chmod +x /start_mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/start_mariadb.sh"]
