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
RUN apt-get update && apt-get upgrade -y && apt-get install -y php-fpm php-mysql
EXPOSE 9000

# Sets up directories & imports wordpress into the container.
WORKDIR /tmp
ENV WP_DIR=/tmp/lettercrunch
RUN mkdir $WP_DIR
COPY conf/ .

# -xf = -x: Extract. | -f: The file to act upon.
RUN tar -xf $WP_DIR/wordpress.tar.xz --directory $WP_DIR && \
	mv wp-config.php $WP_DIR && mv index.php $WP_DIR

# Ensures that php-fpm only accepts requests from within the private container network. (WIRED_v7).
RUN NET_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}') && \
	sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = ${NET_ADDR:9000}/' -i /etc/php/7.3/fpm/pool.d/www.conf

# Moves wp-cli into $PATH & Moves the wordpress files to /var/www/ (The mount point of the docker volume)
RUN mv wp-cli.phar /usr/local/bin/wp-cli && \
	cp -Rav ${WP_DIR} /var/www/

# Install Wordpress through the Command Line Interface.
RUN wp-cli core install --allow-root \
					--title="LetterCrunch" \
					--admin_name="$USRNAME" \
					--admin_password="$PASSWD" \
					--admin_email="email@emailservice.org"
					--path="/var/www/wordpress" \
					--url="https://localhost/wordpress"

# Creates a new regular user.
RUN wp-cli user create --allow-root --yes $REGUSERNAME --user_pass="$REG_PASSWD" --path="/var/www/wordpress"

# Explicitly enables php-fpm
CMD	["php-fpm7.3", "-F", "-R"]
