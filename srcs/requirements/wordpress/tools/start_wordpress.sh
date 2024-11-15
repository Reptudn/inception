#!bin/bash

# wait for mysql to start
sleep 10

echo Downloading Wordpress
cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

echo Installing Wordpress
wp core download \
	--allow-root

echo Creating wp-config.php
wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root

echo Adding Wordpress admin user
wp core install \
	--url=$HOST \
	--title=$PAGE_TITLE \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	--allow-root

echo Adding normal user
wp user create \
	$NORMAL_USER \
	$NORMAL_EMAIL \
	--role=author \
	--user_pass=$NORMAL_PASSWORD \
	--allow-root

echo Installing plugins
wp plugin update \
	--all \
	--allow-root

chown -R www-data:www-data /var/www/html

ls -la /var/www/html

echo Starting php-fpm
php-fpm7.4 -F
