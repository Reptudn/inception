FROM debian:bullseye

# Update and install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Copy configuration file
COPY conf /etc/mysql/mariadb.conf.d/

# Copy and set permissions for the start script
COPY tools/start_mariadb.sh /
RUN chmod +x /start_mariadb.sh

# Expose MariaDB port
EXPOSE 3306

# Set the entrypoint to the start script
ENTRYPOINT ["/start_mariadb.sh"]
