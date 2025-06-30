# inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. 

## How to start?
1. in `src/` rename the `.env.exmaple` to `.env`
2. change the credentials to not include admin anywhere
3. in the root folder run `make` and if you changed the .env file correctly it will start up

## Steps
1. NGINX
2. MARIADB
3. WORDPRESS

## TODO
### Mandatory
- [x] mount all volumes to /home/{login}/data
- [x] check env vars that they dont have anything with admin inside
- [x] create {login}.42.fr to a local website
- [x] add only the needed env vars to each contaienr not all the env vars

### Bonus
- [x] redis cache for wordpress
- [x] ftp server to wordpress volume
- [x] static website (without PHP ooooh nooo 😔)
- [x] adminer
- [x] custom useful service (probably grafana (no we just use cadvisor))

## Login for Adminer
System: MySQL
Server: mariadb
Username: `${MARIA_DB_ROOT_USER}`
Password: `${MARIA_DB_ROOT_PASSWORD}`
Database: `${MARIA_DB_DATABASE_NAME}`
