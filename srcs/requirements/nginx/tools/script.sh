#!/bin/bash

if [ -f /default.conf ]; then
  echo "Generating key and certificate (OpenSSL) ..."
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/$DOMAIN_NAME.key \
  -out /etc/ssl/certs/$DOMAIN_NAME.crt \
  -subj "/C=PT/L=Lisbon/O=42Lisboa/OU=student/CN=$DOMAIN_NAME"

  echo "Configuring Nginx ..."
  sed -i "s/domain_here/$DOMAIN_NAME/g" default.conf
  mv default.conf /etc/nginx/conf.d/$DOMAIN_NAME.conf
  mkdir -p /run/nginx
fi

echo "Nginx is ready!"
nginx -g "daemon off;"