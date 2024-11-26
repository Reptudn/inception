FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-cli php-mbstring php-mysqli php-pdo php-mysql wget

# Download Adminer
RUN mkdir -p /var/www/html && \
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php" -O /var/www/html/index.php

ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]