#!/bin/bash

# Create the /run/php directory if it doesn't exist
mkdir -p /run/php

cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp
<<<<<<< HEAD
ls -la

/usr/local/bin/wp core download --allow-root

/usr/local/bin/wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root

/usr/local/bin/wp core install \
=======
wp core download --allow-root

# wait for maria db
# until nc -z -w50 mariadb 3306; do
#     echo "Waiting for MariaDB to start..."
#     sleep 1
# done

php-fpm7.4 -F &

echo $WORDPRESS_DB_HOST
echo root user for db is: $WORDPRESS_DB_USER
echo root user pass is: $WORDPRESS_DB_PASSWORD
echo root user for db is: $WORDPRESS_DB_NAME
echo $HOST
echo $PAGE_TITLE
echo $ADMIN_USER
echo $ADMIN_PASSWORD
echo $ADMIN_EMAIL
echo $NORMAL_USER
echo $NORMAL_EMAIL
echo $NORMAL_PASSWORD

# wp config create \
#     --dbname=$WORDPRESS_DB_NAME \
#     --dbuser=$WORDPRESS_DB_USER \
#     --dbpass=$WORDPRESS_DB_PASSWORD \
#     --dbhost=$WORDPRESS_DB_HOST \
#     --allow-root

wp config create \
    --dbname=wordpress \
    --dbuser=master \
    --dbpass=mainframe \
    --dbhost=mariadb:3306 \
    --allow-root

wp core install \
>>>>>>> 843445b9cd0c102af1689cecacc1ab765a82616f
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