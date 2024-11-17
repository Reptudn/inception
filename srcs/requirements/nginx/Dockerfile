FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs

COPY www /var/www/html
COPY tools/start_nginx.sh /start_nginx.sh

COPY tools/nginx.conf /etc/nginx/conf.d/default.conf
COPY tools/nginx_default.conf /etc/nginx/nginx.conf

# CMD ["nginx", "-g", "daemon off;"]
CMD [ "sh", "/start_nginx.sh" ]