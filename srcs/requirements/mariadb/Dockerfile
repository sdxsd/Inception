# Sets the base of the container to Debian.
FROM debian:buster
# Updates system and installs MariaDB.
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client
# Creates the working directory.
RUN mkdir /tmp/mariadb
# Changes the current directory to /tmp/mariadb, the WORKDIR command is equivalent to "cd"
WORKDIR /tmp/mariadb

# Copies the sql script from the conf directory on the host system.
COPY conf/base-autoconf.sql .
# Replaces the placeholder PASSWD and USRNAME with the credentials from the .env file.
RUN sed "s/PASSWD/\'$PASSWORD\'/g; s/USRNAME/\'$USERNAME\'/g" base-autconf.sql > autoconf.sql
# Starts the (mariadbd) mysql daemon and runs the mariadb autoconfiguration script.
RUN systemctl start mysql && mariadb -u root < /tmp/mariadb/autconf.sql
# Gets the host address of the private docker network.
RUN export NET_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}')
# Configures the mysql (mariadb) server to only accept connections from the private docker network.
RUN sed -i 's/bind-address\s*=.*/bind-address = $NET_ADDR/' /etc/mysql/mariadb.conf.d/50-server.cnf

#     _.-'''''-._
#   .'  _     _  '.
#  /   (o)   (o)   \
# |                 |
# |  \           /  |
#  \  '.       .'  /
#   '.  `'---'`  .'
#     '-._____.-'      I HOPE YOU ARE ENJOYING THIS ARTISANAL DOCKER CONTAINER.
#                      FOR 42 STUDENTS: PLEASE FEEL FREE TO BASE YOUR ENTIRE PROJECT
#                      ON THIS REPO.
#
#                      YOU WILL FACE ONLY THE WRATH OF YOUR CONSCIENCE.

EXPOSE 3306 # Exposes the default port for mysql as required in the subject.
