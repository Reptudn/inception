#!/bin/bash

rm -rf /var/www/html/*

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

cd /var/www/html/

echo Creating wp-config.php...
wp config create \
    --dbname=$MARIA_DB_DATABASE_NAME \
    --dbuser=$MARIA_DB_ROOT_USER \
    --dbpass=$MARIA_DB_ROOT_PASSWORD \
    --dbhost="mariadb" \
    --path=/var/www/html/ \
    --allow-root

echo Installing WordPress...
wp core install \
    --url="wordpress:9000" \
    --title="Inception Blog" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --path=/var/www/html/ \
    --allow-root

pwd
ls -la

echo Starting PHP-FPM...
php-fpm7.4 -F