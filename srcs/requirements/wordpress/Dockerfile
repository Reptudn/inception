FROM debian:bullseye

# RUN apt-get update && apt-get install -y \
# 	php-fpm \
# 	php-mysql \
# 	php-mbstring \
# 	wget \
# 	unzip

# RUN mkdir -p /var/www/html/

# RUN wget https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1 && \
#     rm latest.tar.gz


# RUN mkdir -p /var/www/html
# RUN chown -R www-data:www-data /var/www/html

# WORKDIR /var/www/html
# RUN wp core download
# RUN wp core run --allow-root

# EXPOSE 9000

# COPY tools/ /

# CMD [ "sh", "./start.sh" ]
# COPY srcs/requirements/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php		
# COPY srcs/requirements/wordpress/wp-config.php /var/www/html/wp-config.php

# TODO: update this to mine
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php-fpm \
    php-mysql \
    php-zip \
    php-redis \
    curl && \
    sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# RUN apt-get install -y sendmail
# RUN mkdir -p /run/php
RUN mkdir -p /var/www/html

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

COPY tools/start.sh /var/www/html
# COPY www/index.html /var/www/html/
RUN chmod +x start.sh

# ENTRYPOINT ["sh", "start.sh"]
# ENTRYPOINT [ "sh", "/usr/local/bin/start.sh" ]
CMD [ "sh", "/start.sh" ]