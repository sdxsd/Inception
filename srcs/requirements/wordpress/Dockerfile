FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y php-fpm php-mysql
EXPOSE 9000

RUN mkdir /tmp/lettercrunch
WORKDIR /tmp/lettercrunch
COPY conf/ /tmp/lettercrunch/

# -xzf = -x: Extract. | -z: Use gunzip to unzip the .gz component. | -f: The file to act upon.
# E{x}tract {z}e {f}ile now!
RUN tar -xzf
