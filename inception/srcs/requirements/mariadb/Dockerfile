FROM debian:buster

RUN apt-get update

RUN apt-get -y install mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/init.sh /home

EXPOSE 3306

RUN chmod +x /home/init.sh

ENTRYPOINT ["/home/init.sh"]

CMD ["mysqld"]

