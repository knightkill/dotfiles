WP_PASSWORD=root
WP_USERNAME=root
mkdir $1
cd $1
wp core download
#mysql --user="$WP_USERNAME" --password="$WP_PASSWORD" --execute="CREATE DATABASE wp-$1;"
wp config create --dbname=wp-$1 --dbuser=root --dbpass=root
wp db create
wp core install --url=$1.test --title=$1 --admin_user=admin --admin_password=adminpass --admin_email=hardip@anormaly.com
#wp plugin install updraftplus --activate
#wp plugin install wp-optimize --activate
valet link $1
#node ~/Boxes/Projects/AutomateWordpress/addawscreds/index.js $1
