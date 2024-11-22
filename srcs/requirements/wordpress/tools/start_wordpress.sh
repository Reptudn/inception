#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

cd /var/www/html/

until mysqladmin ping -h mariadb --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

wp config create \
    --dbname=$MARIA_DB_DATABASE_NAME \
    --dbuser=$MARIA_DB_ROOT_USER \
    --dbpass=$MARIA_DB_ROOT_PASSWORD \
    --dbhost="mariadb:3306" \
    --path=/var/www/html/ \
    --allow-root

wp core install \
    --url="localhost:9000" \
    --title="Inception Blog" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --path=/var/www/html/ \
    --allow-root

php-fpm7.4 -F