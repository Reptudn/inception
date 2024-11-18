#!/bin/bash

# Create the /run/php directory if it doesn't exist
mkdir -p /run/php

cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp
ls -la

/usr/local/bin/wp core download --allow-root

/usr/local/bin/wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root

/usr/local/bin/wp core install \
    --url=$HOST \
    --title=$PAGE_TITLE \
    --admin_user=$ADMIN_USER \
    --admin_password=$ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL \
    --allow-root

/usr/local/bin/wp user create \
    $NORMAL_USER \
    $NORMAL_EMAIL \
    --role=author \
    --user_pass=$NORMAL_PASSWORD \
    --allow-root

# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root

chown -R www-data:www-data /var/www/html

tail -f /dev/null