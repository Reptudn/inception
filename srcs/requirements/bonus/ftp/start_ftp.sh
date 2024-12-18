#!/bin/bash

useradd -m ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
mkdir -p /var/www/html
chown -R ${FTP_USER}:${FTP_USER} /var/www/html
mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd.conf