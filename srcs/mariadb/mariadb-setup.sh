#!/bin/bash

service mysql start

root_password=mypass
admin_user=admin

## update root Password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"

## remove anonymous users and test database
mysql -e "DROP USER IF EXISTS ''@'$(hostname)';"
mysql -e "DROP DATABASE IF EXISTS test;"

mysql -e "CREATE USER '$admin_user'@'localhost' IDENTIFIED BY 'password';"

mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL ON wordpress.* TO '$admin_user'@'localhost' IDENTIFIED BY '$admin_password' WITH GRANT OPTION;"

mysql -e "FLUSH PRIVILEGES;"

sleep infinity
