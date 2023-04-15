#! /bin/bash

mysql_install_db 

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`$DB_USER\`@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO \`$DB_USER\`@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

sleep 3

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld_safe