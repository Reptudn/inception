FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copy initialization script (if needed)
COPY tools/init.sql /etc/mysql/init.sql

# Copy the startup script
COPY tools/start_mariadb.sh /
RUN chmod +x /start_mariadb.sh

# Set the startup script as the entry point
ENTRYPOINT ["/start_mariadb.sh"]
