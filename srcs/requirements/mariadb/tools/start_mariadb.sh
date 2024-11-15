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
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Keep the container running
tail -f /dev/null
