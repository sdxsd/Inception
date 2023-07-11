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

FROM debian:buster

ARG PASSWORD
ARG USERNAME
ARG REGPASSWORD
ARG REGUSERNAME

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

# Updates container & exposes port 9000 for php-fpm (CGI).
RUN apt-get update && apt-get upgrade -y && apt-get install -y php7.3-fpm php7.3-mysql
EXPOSE 9000

# Sets up directories & imports wordpress into the container.
WORKDIR /tmp
COPY ./conf/wordpress.tar.xz $WORKDIR
COPY ./conf/wp-config.php $WORKDIR
COPY ./conf/WP-install.sh $WORKDIR

# Makes sure that the wordpress install script uses the correct details.
RUN sed -i "s/PLACEHOLDER_PASS/${PASSWORD}/g; s/PLACEHOLDER_USERNAME/${USERNAME}/g;" WP-install.sh
RUN sed -i "s/REGPASSWORD/${REGPASSWORD}/g; s/REGUSERNAME/${REGUSERNAME}/g;" WP-install.sh && chmod +x WP-install.sh

# -xvf = (-x: Extract. | -v: verbose | -f: The file to act upon.)
RUN tar -xvf wordpress.tar.xz
WORKDIR /tmp/wordpress

# Inserts credentials from .env into the wp-config.php file.
RUN mv ../wp-config.php . && sed -i "s/PASSWD/${PASSWORD}/g; s/USRNAME/${USERNAME}/g;" wp-config.php

RUN mkdir -p /var/www/wordpress


# sets which IP addresses php fpm will accept requests from.
RUN sed "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g" -i /etc/php/7.3/fpm/pool.d/www.conf
# Moves wp-cli into $PATH & Moves the wordpress files to /var/www/ (The mount point of the docker volume)
RUN mv wp-cli.phar /usr/local/bin/wp-cli && \
	cp -av /tmp/wordpress/. /var/www

# Change workdir
WORKDIR /var/www

# Creates a php directory which for some reason isn't automatically created on install.
RUN mkdir /run/php && chmod 777 /run/php

# Install Wordpress through the Command Line Interface.
# Start the CGI manager.
CMD ./tmp/WP-install.sh && \
	php-fpm7.3 -F -R
