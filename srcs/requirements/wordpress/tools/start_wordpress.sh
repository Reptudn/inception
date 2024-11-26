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

echo Adding redis vars to wp-config.php...
wp config set WP_REDIS_HOST redis --add \
    --type=constant \
    --path=/var/www/html/ \
    --allow-root

wp config set WP_REDIS_PORT 6379 --add \
    --type=constant \
    --path=/var/www/html/ \
    --allow-root

echo Installing WordPress...
wp core install \
    --url="localhost" \
    --title="Inception" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --path=/var/www/html/ \
    --allow-root

wp user create \
    $WORDPRESS_TEST_USER \
    $WORDPRESS_TEST_USER_EMAIL \
    --user_pass=$WORDPRESS_TEST_USER_PASSWORD \
    --role=author \
    --path=/var/www/html/ \
    --allow-root

#enable redis cache
wp plugin install redis-cache \
    --activate \
    --path=/var/www/html/ \
    --allow-root

#enable redis cache
wp redis enable --path=/var/www/html/ --allow-root

# echo "Configuring PHP-FPM to listen on 0.0.0.0:9000..."
sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

echo Starting PHP-FPM...
php-fpm7.4 -F