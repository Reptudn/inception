FROM debian:bullseye

RUN apt-get update && apt-get install -y nodejs npm

COPY tools/ ./
RUN npm install

ENTRYPOINT [ "node", "server.js" ]