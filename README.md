# inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. 

## How to start?
1. in `src/` rename the `.env.exmaple` to `.env`
2. change the credentials to not include admin anywhere
3. in the root folder run `make` and if you changed the .env file correctly it will start up
4. If it doesn´t start up fully there might be a port already in use for some container.. change that and then it will run and repeat step 3

## Reachable Services once running
> All Passwords have been set in the `.env` file
- Wordpress via NGINX on port 443 (self-signed HTTPS)
- FTP Server that links to the `www` dir of NGINX via port 21 and 40000-40100
- Adminer to visualize MariaDB on port 8080
- The Custom page with the spinning cat on port 4242
- CAdvisor on port 7070 for the docker container stats (i/o, networking, cpu, ram, ...)

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
