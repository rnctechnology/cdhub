FROM centos:centos7

MAINTAINER RNCTech <zilinchen@yahoo.com>

ADD mariadb.repo /etc/yum.repos.d/mariadb.repo

RUN yum -y update && yum clean all
RUN yum -y install --setopt=tsflags=nodocs epel-release && yum -y install --setopt=tsflags=nodocs mariadb-server mariadb-client bind-utils pwgen psmisc hostname net-tools

ADD configMariaDB.sh /root/configMariaDB.sh
ADD configComponents.sh /root/configComponents.sh
ADD resetMariaDB.sh /root/resetMariaDB.sh
ADD testMariaDB.sh /root/testMariaDB.sh

ADD Ambari-DDL-MySQL-CREATE.sql /root/Ambari-DDL-MySQL-CREATE.sql
ADD hive-schema-0.14.0.mysql.sql /root/hive-schema-0.14.0.mysql.sql
COPY my.cnf /etc/my.cnf
COPY server.cnf /etc/my.cnf.d/server.cnf
COPY addGroup.sh /root/addGroup.sh
COPY mariadb-entrypoint.sh /root/mariadb-entrypoint.sh

RUN chmod +x /root/*.sh
RUN mkdir -p /var/run/mariadb/
RUN mkdir -p /var/log/mariadb/
RUN /root/addGroup.sh /var/lib/mysql/
RUN /root/addGroup.sh /var/log/mariadb/
RUN /root/addGroup.sh /var/run/mariadb/

VOLUME /var/lib/mysql
VOLUME /var/log/mariadb

ENTRYPOINT ["/root/mariadb-entrypoint.sh"]

EXPOSE 3306
