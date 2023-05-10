FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx
EXPOSE 443

RUN mkdir /tmp/certification_fortification
WORKDIR /tmp/certification_fortification

COPY conf/cert ${WORKDIR}
RUN	chmod +x mkcert && \
	./mkcert -install && \
	./mkcert localhost && \
	mv *.pem /etc/nginx/ssl/ && \


WORKDIR /tmp/
