FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/init.sql /etc/mysql/init.sql
RUN mysql_install_db


COPY tools/start_mariadb.sh /
RUN chmod +x /start_mariadb.sh


ENTRYPOINT [ "sh", "/start_mariadb.sh"]
