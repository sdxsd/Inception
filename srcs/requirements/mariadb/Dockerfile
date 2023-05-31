# THIS FILE IS LICENSED UNDER THE GNU GPLv3
# Copyright (C) 2022 Will Maguire

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

# The definition of Free Software is as follows:
# 	- The freedom to run the program, for any purpose.
# 	- The freedom to study how the program works, and adapt it to your needs.
# 	- The freedom to redistribute copies so you can help your neighbor.
# 	- The freedom to improve the program, and release your improvements
# 	to the public, so that the whole community benefits.

# A program is free software if users have all of these freedoms.

# Sets the base of the container to Debian.
FROM debian:buster

ARG PASSWORD
ARG USERNAME
ARG REGPASSWORD
ARG REGUSERNAME

# Updates system and installs MariaDB.
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client
# Creates the working directory.
RUN mkdir /tmp/mariadb
# Changes the current directory to /tmp/mariadb, the WORKDIR command is equivalent to "cd"
WORKDIR /tmp/mariadb

# Exposes the default port for mysql as required in the subject.
EXPOSE 3306

# Copies the sql script from the conf directory on the host system.
COPY conf/base-autoconf.sql ${WORKDIR}
# Replaces the placeholder PASSWD and USRNAME with the credentials from the .env file.
RUN sed "s/PASSWD/${PASSWORD}/g; s/USRNAME/${USERNAME}/g; s/REGUSRNAME/${REGUSERNAME}/g; s/REGPASSWD/${REGPASSWORD}/g" base-autoconf.sql > autoconf.sql
RUN sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# Starts the (mariadbd) mysql daemon and runs the mariadb autoconfiguration script.
RUN service mysql start && mariadb -u root < /tmp/mariadb/autoconf.sql

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

CMD mysqld
