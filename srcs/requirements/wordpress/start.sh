#!bin/bash

# php-fpm7.4 -F

# wait for mysql to start
sleep 10
# Install Wordpress

# TODO: update this to mine
if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root --skip-check

    wp core install --url=$HOST --title=$PAGE_TITLE --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL \
        --allow-root

    wp user create $NORMAL_USER $NORMAL_EMAIL --role=author --user_pass=$NORMAL_PASSWORD --allow-root

#   wp config  set WP_DEBUG true  --allow-root

    # wp config set FORCE_SSL_ADMIN 'false' --allow-root

    # wp config set WP_REDIS_HOST $redis_host --allow-root

    # wp config set WP_REDIS_PORT $redis_port --allow-root

    # wp config set WP_CACHE 'true' --allow-root

    # wp plugin install redis-cache --allow-root

    # wp plugin activate redis-cache --allow-root

    # wp redis enable --allow-root

    chmod 777 /var/www/html/wp-content

    # install theme

    # wp theme install impressionist

    # wp theme activate impressionist

    # wp theme update impressionist
fi


/usr/sbin/php-fpm7.3 -F