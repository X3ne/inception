FROM debian:buster

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

WORKDIR /var/lib/mysql

RUN apt-get update && apt-get install mariadb-server curl -y \
    && rm -rf /var/lib/apt/lists/*

RUN service mysql start \
    && mysql -e "UPDATE mysql.user SET Password = PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User = 'root';" \
    && mysql -e "DROP USER IF EXISTS ''@'$hostname';" \
    && mysql -e "DROP DATABASE IF EXISTS test;" \
    && mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" \
    && mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" \
    && mysql -e "FLUSH PRIVILEGES;"

EXPOSE 3306

ENTRYPOINT [ "mysqld", "--bind-address=0.0.0.0" ]
