FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs

COPY tools/start_nginx.sh /start_nginx.sh

COPY tools/nginx.conf /etc/nginx/nginx.conf
COPY tools/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "sh", "/start_nginx.sh" ]