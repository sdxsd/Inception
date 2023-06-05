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

# Specifies that the current container is to be based off Debian buster.
FROM debian:buster
# Updates the container with the latest bloatware.
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx
# Exposes port 443, which is mapped to port 443 on the host machine.
EXPOSE 443

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

# Creates temporary directory.
RUN mkdir /tmp/certification_fortification
WORKDIR /tmp/certification_fortification

# Creates and installs SSL certificate.
COPY conf/cert/mkcert ${WORKDIR}
RUN	chmod +x mkcert && \
	./mkcert -install && \
	./mkcert localhost && \
	mkdir -p /etc/nginx/ssl && \
	mv *.pem /etc/nginx/ssl/

# Creates temp nginx conf directory.
RUN mkdir /tmp/nginx_conf
WORKDIR /tmp/nginx_conf

# Clears default configs and install the nginx conf into the "sites-available directory".
# Links the nginx.conf to the sites enabled directory, thus telling nginx that it is a site
# which it should be serving.
COPY conf/nginx.conf ${WORKDIR}
RUN rm -rfv /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available/ && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# Runs nginx in the foreground.
CMD ["nginx", "-g" ,"daemon off;"]
