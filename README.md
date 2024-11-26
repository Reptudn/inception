# inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. 

## Steps
1. NGINX
2. MARIADB
3. WORDPRESS

## TODO
### Mandatory
- [ ] mount all volumes to /home/{login}/data
- [ ] check env vars that they dont have anything with admin inside
- [ ] create {login}.42.fr to a local website
- [x] add only the needed env vars to each contaienr not all the env vars

### Bonus
- [ ] redis cache for wordpress
- [x] ftp server to wordpress volume
- [ ] static website (without PHP ooooh nooo 😔)
- [x] adminer

## Login for Adminer
System: MySQL
Server: mariadb
Username: ${MARIA_DB_ROOT_USER}
Password: ${MARIA_DB_ROOT_PASSWORD}
Database: ${MARIA_DB_DATABASE_NAME}