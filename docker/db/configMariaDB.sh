#!/bin/bash

#RNCTechnology
#author Zilin Chen @ zilinchen@yahoo.com

mysql_host=`hostname -f`
admin_user="root"
admin_pwd="Admin123"
if [ $# -gt 0 ]; then
  admin_pwd=$1
fi

data_dir="/var/lib/mysql"
db_port="3306"

chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user mysql > /dev/null

mysqld_safe --user mysql &
sleep 5s
mysqladmin -u $admin_user password $admin_pwd

#cp /usr/share/mysql/my-medium.cnf /etc/my.cnf

ps -ef | grep mysql | grep -v grep | awk '{print $2}' | xargs kill -9
sleep 5s
mysqld_safe --user mysql &
sleep 10s

echo "$admin_user and $admin_pwd"

mysql -u $admin_user -p$admin_pwd -e "UPDATE mysql.user SET Password = PASSWORD('$admin_pwd') WHERE User = '$admin_user'; FLUSH PRIVILEGES";
mysql -u $admin_user -p$admin_pwd -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$admin_pwd' WITH GRANT OPTION; FLUSH PRIVILEGES";

#mysql -u $admin_user -p$admin_pwd -e "DROP USER ''@'localhost'";
#mysql -u $admin_user -p$admin_pwd -e "DROP USER ''@'$mysql_host'";
#mysql -u $admin_user -p$admin_pwd -e "FLUSH PRIVILEGES";

#drop test database    
mysql -u $admin_user -p$admin_pwd -e "DELETE FROM mysql.db WHERE Db LIKE 'test%'";
mysql -u $admin_user -p$admin_pwd -e "DROP DATABASE test";
mysql -u $admin_user -p$admin_pwd -e "FLUSH PRIVILEGES";
#mysql -u $admin_user -p$admin_pwd -e "select Host,User,Password from mysql.user where User = 'root'";
sleep 5
