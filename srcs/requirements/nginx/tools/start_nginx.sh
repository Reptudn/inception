openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/certs/ssl_key.key -out /etc/nginx/certs/ssl_cert.crt \
	-subj "/C=DE/ST=BW/L=HN42/O=42Heilbronn/CN=$DOMAIN"

echo starting nginx
nginx -g 'daemon off;'
echo after nginx command