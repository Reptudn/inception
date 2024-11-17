#!/bin/bash

# Create the /run/php directory if it doesn't exist
mkdir -p /run/php

cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp
wp core download --allow-root

# wait for maria db
until nc -z -w50 mariadb 3306; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

sleep 10

echo deez nuts

pwd
ls -la

wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root

echo deez nuts2

wp core install \
    --url=$HOST \
    --title=$PAGE_TITLE \
    --admin_user=$ADMIN_USER \
    --admin_password=$ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL \
    --allow-root

wp user create \
    $NORMAL_USER \
    $NORMAL_EMAIL \
    --role=author \
    --user_pass=$NORMAL_PASSWORD \
    --allow-root

# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root

chown -R www-data:www-data /var/www/html

# Start PHP-FPM
php-fpm7.4 -F