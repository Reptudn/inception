# FROM debian:bullseye

# RUN apt-get update && apt-get install -y php7.4 php7.4-fpm curl netcat

# COPY tools/start_wordpress.sh /start_wordpress.sh
# RUN chmod +x /start_wordpress.sh

# CMD [ "sh", "/start_wordpress.sh" ]

FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
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

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# needed to create the pid file
RUN mkdir /run/php

COPY tools/start_wordpress.sh start_wordpress.sh
RUN chmod +x start_wordpress.sh

CMD [ "sh", "/start_wordpress.sh" ]