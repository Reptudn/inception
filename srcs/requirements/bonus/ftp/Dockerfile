FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY vsftpd.conf /etc/vsftpd.conf
COPY start_ftp.sh /start_ftp.sh

ENTRYPOINT [ "bash", "/start_ftp.sh" ]