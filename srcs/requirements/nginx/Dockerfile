FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl php-fpm php-mysql

RUN mkdir -p /etc/nginx/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/certs/localhost.key -out /etc/nginx/certs/localhost.crt \
	-subj "/C=DE/ST=BW/L=HN42/O=42Heilbronn/CN=localhost"

COPY www /var/www/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx"]