#!/usr/bin/env bash
chown -R mysql:mysql /var/lib/mysql
if [ ! -d /var/lib/mysql/wordpress ]; then
service mysql start
sleep 2
mysql -u root -e "CREATE USER IF NOT EXISTS wpuser@'%' IDENTIFIED BY '$MYSQL_PASS';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO wpuser@'%';"
mysql -u root -e "flush privileges;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS';"
sed -i "s/password =/\password = $MYSQL_ROOT_PASS/" "/etc/mysql/debian.cnf"
service mysql stop
else
service mysql start
sleep 2
sed -i "s/password =/\password = $MYSQL_ROOT_PASS/" "/etc/mysql/debian.cnf"
service mysql stop
fi
exec "$@"

