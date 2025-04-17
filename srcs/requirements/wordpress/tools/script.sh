#!bin/bash

echo "Waiting for Mariadb creation..."
sleep 5

cd /var/www/html
wp core download --allow-root

if [ ! -e /var/www/html/wp-config.php ]; then
    wp config create	--allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
    					--dbhost=mariadb:3306
    wp core install     --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
    wp user create      --allow-root --role=author $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD >> /log.txt
fi

echo "Wordpress Ready!"
php-fpm7.4 -F