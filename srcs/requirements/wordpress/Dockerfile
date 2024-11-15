FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysqli \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-imagick \
    php7.4-dom \
    php7.4-zip \
    curl \
    netcat

# RUN mkdir -p /var/www/html/

# TODO: create a config and copy it here into the centainer

COPY tools/start_wordpress.sh /start_wordpress.sh
RUN chmod +x /start_wordpress.sh

CMD [ "sh", "/start_wordpress.sh" ]