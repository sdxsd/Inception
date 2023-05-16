FROM debian:buster
RUN MKDIR /tmp/mariadb
WORKDIR /tmp/mariadb
COPY . .
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client
RUN mkdir /tmp/mariadb

WORKDIR /tmp/mariadb
COPY conf/base-autoconf.sql .
RUN sed "s/PASSWD/\'$PASSWORD\'/g; s/USRNAME/\'$USERNAME\'/g" base-autconf.sql > autoconf.sql
RUN systemctl start mysql && mariadb -u root < /tmp/mariadb/autconf.sql

RUN export NET_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}')
RUN sed ''

EXPOSE 3306
