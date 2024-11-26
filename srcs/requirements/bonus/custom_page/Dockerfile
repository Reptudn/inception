FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-cli

COPY www/ /var/www/html/

ENTRYPOINT [ "php", "-S", "0.0.0.0:4242", "-t", "/var/www/html" ]