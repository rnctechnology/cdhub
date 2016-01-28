#!/bin/bash

#RNCTechnology
#author Zilin Chen @ zilinchen@yahoo.com

mysql_host=`hostname -f`
root_user="root"
root_pwd=$1
ambari_db="ambari"
ambari_user="ambari"
ambari_pwd=$2
hive_db="hive"
hive_user="hive"
hive_pwd=$3
oozie_db="oozie"
oozie_user="oozie"
oozie_pwd=$4

#start DB server if not yet
dbstart=$(ps -ef | grep mysql | grep -v grep | wc -l)
if [ $dbstart -lt 2 ]; then
  mysqld_safe --user mysql &
  sleep 5s
fi

#configAmbari
    set -f
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$ambari_user'@'%' IDENTIFIED BY '$ambari_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$ambari_user'@'%'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$ambari_user'@'localhost' IDENTIFIED BY '$ambari_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$ambari_user'@'localhost'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$ambari_user'@'$mysql_host' IDENTIFIED BY '$ambari_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$ambari_user'@'$mysql_host'";
    mysql -u $root_user -p$root_pwd -e "FLUSH PRIVILEGES";
    set +f
    mysql -u $ambari_user -p$ambari_pwd -e "CREATE DATABASE $ambari_db";
    mysql -u $ambari_user -p$ambari_pwd -e "USE $ambari_db; SOURCE Ambari-DDL-MySQL-CREATE.sql;";
#configOozie
    set -f
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$oozie_user'@'%' IDENTIFIED BY '$oozie_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$oozie_user'@'%'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$oozie_user'@'localhost' IDENTIFIED BY '$oozie_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$oozie_user'@'localhost'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$oozie_user'@'$mysql_host' IDENTIFIED BY '$oozie_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$oozie_user'@'$mysql_host'";
    mysql -u $root_user -p$root_pwd -e "FLUSH PRIVILEGES";
    set +f
    mysql -u $oozie_user -p$oozie_pwd -e "CREATE DATABASE $oozie_db";
#configHive
    set -f
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$hive_user'@'localhost' IDENTIFIED BY '$hive_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$hive_user'@'localhost'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$hive_user'@'%' IDENTIFIED BY '$hive_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$hive_user'@'%'";
    mysql -u $root_user -p$root_pwd -e "CREATE USER '$hive_user'@'$mysql_host' IDENTIFIED BY '$hive_pwd'";
    mysql -u $root_user -p$root_pwd -e "GRANT ALL PRIVILEGES ON *.* TO '$hive_user'@'$mysql_host'";
    mysql -u $root_user -p$root_pwd -e "FLUSH PRIVILEGES";
    set +f
    mysql -u $hive_user -p$hive_pwd -e "CREATE DATABASE $hive_db";
    mysql -u $hive_user -p$hive_pwd -e "USE $hive_db; SOURCE hive-schema-0.14.0.mysql.sql;";
