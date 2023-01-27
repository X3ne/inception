FROM debian:buster

ARG MYSQL_HOST
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    && apt-get install curl php-fpm mariadb-client php-mysql -y \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www \
    && chown -R www-data:www-data /usr/local/bin \
    && chown -R www-data:www-data /var/log \
    && chown -R www-data:www-data /run

RUN service php7.3-fpm start && service php7.3-fpm stop \
    && sed -i "s/\/run\/php\/php7.3-fpm.sock/wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

COPY ./entrypoint.sh ./

USER www-data

## Install wordpress via wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp \
    && wp core download

EXPOSE 9000

## rewrite this
USER root
CMD ["sh", "./entrypoint.sh"]
