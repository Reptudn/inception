#!/bin/bash

# Create the /run/mysqld directory if it doesn't exist
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# Start MariaDB in the background
mysqld &

echo "Waiting for MariaDB to be ready..."
until mysqladmin ping; do
    sleep 1
done

echo root user for db is:  $MYSQL_ROOT_USER
echo root user pass is: $MYSQL_ROOT_PASSWORD
echo db name is: $MYSQL_DATABASE

echo "MariaDB is ready!"
echo "Creating database ${MYSQL_DATABASE}..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

echo "Database ${MYSQL_DATABASE} created!"

# Keep the container running
tail -f /dev/null