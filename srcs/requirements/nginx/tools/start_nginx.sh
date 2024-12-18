#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/ssl_key.key -out /etc/nginx/certs/ssl_cert.crt \
    -subj "/C=DE/ST=BW/L=HN42/O=42Heilbronn/CN=localhost"

if [ ! -f /etc/nginx/certs/ssl_key.key ] || [ ! -f /etc/nginx/certs/ssl_cert.crt ]; then
    echo "Error: SSL certificate or key file not found!"
    exit 1
fi

# Test NGINX configuration
nginx -t
if [ $? -ne 0 ]; then
    echo "Error: NGINX configuration test failed!"
    exit 1
fi

# Start NGINX
echo "Starting Nginx..."
nginx -g 'daemon off;'
echo "Nginx exited!"
