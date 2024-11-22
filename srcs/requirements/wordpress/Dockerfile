FROM debian:bullseye

# Install required packages
RUN apt update -y && \
	apt install wget unzip php7.4 php7.4-fpm php7.4-mysql curl default-mysql-client -y

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php/

# Copy the start script
COPY tools/start_wordpress.sh /start_wordpress.sh
RUN chmod +x /start_wordpress.sh

# Start services and WordPress
ENTRYPOINT [ "sh", "/start_wordpress.sh" ]