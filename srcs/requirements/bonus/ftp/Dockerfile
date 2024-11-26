FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY vsftpd.conf /etc/vsftpd.conf

ARG FTP_USER
ARG FTP_PASSWORD

ENV FTP_USER=${FTP_USER}
ENV FTP_PASSWORD=${FTP_PASSWORD}

RUN echo $FTP_USER
RUN echo $FTP_PASSWORD

RUN useradd -m ${FTP_USER} && echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd && \
	mkdir -p /var/www/html && \
	chown -R ${FTP_USER}:${FTP_USER} /var/www/html && \
    mkdir -p /var/run/vsftpd/empty && \
    chmod 755 /var/run/vsftpd/empty

ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]