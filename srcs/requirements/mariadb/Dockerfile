FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY conf /etc/mysql/conf.d

COPY tools/ /

CMD ["sh", "/start_mariadb.sh"]