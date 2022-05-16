FROM debian:buster

RUN apt-get update


RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

RUN apt-get -y install wget
RUN apt-get -y install curl

WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

COPY conf/wp-config.php /tmp
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/wp_init.sh /home
RUN chmod +x /home/wp_init.sh

RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*

RUN mkdir -p /run/php/
RUN touch /run/php/php7.3-fpm.pid

EXPOSE 9000

ENTRYPOINT ["/home/wp_init.sh"]

CMD ["php-fpm7.3", "-F", "-R"]

