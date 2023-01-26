FROM debian:buster

WORKDIR /var/www

USER www-data

RUN apt-get update && apt-get install -y \
    && apt-get install curl php-fpm -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download

CMD [ "wp", "--info" ]
