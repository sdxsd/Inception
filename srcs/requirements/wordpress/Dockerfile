FROM debian:buster

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
RUN wp-cli user create --allow-root --yes $REG_USRNAME --user_pass="$REG_PASSWD" --path="/var/www/wordpress"

# Explicitly enables php-fpm
CMD	["php-fpm7.3", "-F", "-R"]
