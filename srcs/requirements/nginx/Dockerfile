FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl php-fpm php-mysql

RUN mkdir /etc/nginx/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/certs/localhost.key -out /etc/nginx/certs/localhost.crt \
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=localhost"

COPY www /var/www/html

COPY conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]