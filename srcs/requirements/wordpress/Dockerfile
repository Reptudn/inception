FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	php-mbstring \
	wget \
	unzip

RUN mkdir -p /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

# RUN chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
# COPY srcs/requirements/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php		
# COPY srcs/requirements/wordpress/wp-config.php /var/www/html/wp-config.php

