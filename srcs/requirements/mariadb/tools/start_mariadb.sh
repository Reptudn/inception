#!/bin/bash

# Create the /run/mysqld directory if it doesn't exist
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# Start MariaDB in the background
mysqld & # --init-file=/etc/mysql/init.sql &

echo "Waiting for MariaDB to be ready..."
# Add a delay to ensure MariaDB has time to start
sleep 10

# Improved readiness check
until mysqladmin ping --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

echo "MariaDB is ready!"
echo "Creating database ${MARIA_DB_DATABASE_NAME}..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIA_DB_DATABASE_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${MARIA_DB_ROOT_USER}'@'%' IDENTIFIED BY '${MARIA_DB_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIA_DB_DATABASE_NAME}.* TO '${MARIA_DB_ROOT_USER}'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

echo "Database ${MARIA_DB_DATABASE_NAME} created!"

# Keep the container running
tail -f /dev/null