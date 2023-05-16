FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx
EXPOSE 443

RUN mkdir /tmp/certification_fortification
WORKDIR /tmp/certification_fortification

COPY conf/cert ${WORKDIR}
RUN	chmod +x mkcert && \
	./mkcert -install && \
	./mkcert localhost && \
	mv *.pem /etc/nginx/ssl/

RUN mkdir /tmp/nginx_conf
WORKDIR /tmp/nginx_conf

COPY conf/nginx.conf ${WORKDIR}
RUN rm -rfv /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g" ,"daemon off;"]