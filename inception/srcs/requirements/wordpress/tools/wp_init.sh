#!/usr/bin/env bash
if [ ! -f /var/www/wordpress/wp-config.php ]; then
cd /var/www/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

sed -i "s/field_for_substitute/$MYSQL_PASS/g" /tmp/wp-config.php

cp /tmp/wp-config.php /var/www/wordpress
wp core install --url=sdominqu.42.fr --title=Damirikus --admin_user=sdominqu --admin_password=$USER_PASS --admin_email=n9178743379@mail.ru --allow-root
wp user create user user@example.com --user_pass=$USER_PASS --allow-root
sleep 5
fi
exec "$@"
