wp config create --allow-root \
  --dbname=$MYSQL_DATABASE \
  --dbuser=$MYSQL_USER \
  --dbpass=$MYSQL_PASSWORD \
  --dbhost=$MYSQL_HOST

if ! wp core is-installed --allow-root
then
  wp core install --allow-root \
    --url=$DOMAIN_NAME \
    --title="$WP_SITE_TITLE" \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL
fi

php-fpm7.3 -F
