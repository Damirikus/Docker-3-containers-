FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx

RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=RUSSIA/L=kazan/O=innoaca/OU=42kazan/CN=forhjy" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

COPY conf/default /etc/nginx/sites-available



EXPOSE 443


ENTRYPOINT ["nginx", "-g", "daemon off;"]


