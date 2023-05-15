FROM debian:buster
RUN MKDIR /tmp/mariadb
WORKDIR /tmp/mariadb
COPY . .
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server
EXPOSE 3306
