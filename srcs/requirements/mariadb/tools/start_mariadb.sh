#!/bin/bash

# Initialize MariaDB data directory if it's empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to start
until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to be ready..."
    sleep 1
done

# Create database and user
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

# Keep the container running
tail -f /dev/null
