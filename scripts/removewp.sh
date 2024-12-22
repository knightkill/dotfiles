# WP_PASSWORD=root
# WP_USERNAME=root
# git clone git@github.com:WordPress/WordPress.git $1
# cd $1
# mysql --user="$WP_USERNAME" --password="$WP_PASSWORD" --execute="CREATE DATABASE wp-$1;"
# wp config create --dbname=wp-$1 --dbuser=root --dbpass=root
# wp db create
# wp core install --url=$1.test --title=$1 --admin_user=admin --admin_password=adminpass --admin_email=hardip@anormaly.com
# wp plugin install updraftplus --activate
# wp plugin install wp-optimize --activate
# valet link $1

cd $1
wp plugin delete updraftplus
wp plugin delete wp-optimize
wp db drop
valet unlink $1
cd ..
rm -rf $1
