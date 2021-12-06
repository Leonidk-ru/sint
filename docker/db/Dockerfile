FROM debian:10
ARG DEBIAN_FRONTEND=noninteractive
ARG MYSQL_ROOT_PASSWORD 'StrongPawwsord'
WORKDIR /TMP
RUN apt-get update && \
 apt-get -y install \
 debconf \
 apt-utils \
 curl \
 wget \
 gnupg \
 lsb-release \
 apt-transport-https \
 ca-certificates 
CMD chown -R mysql. /var/log/mysql && 

RUN curl -O https://repo.mysql.com/mysql-apt-config_0.8.20-1_all.deb && \
 echo mysql-apt-config  mysql-apt-config/select-server  select  mysql-8.0 | debconf-set-selections && \
 echo mysql-apt-config  mysql-apt-config/select-product select  Apply | debconf-set-selections && \
 dpkg -i mysql-apt-config* && \
 apt-get update && \
 echo mysql-server      mysql-server/root-pass password $MYSQL_ROOT_PASSWORD | debconf-set-selections && \
 echo mysql-server      mysql-server/re-root-pass       password $MYSQL_ROOT_PASSWORD | debconf-set-selections && \
 echo mysql-server      mysql-server/default-auth-override select 2 | debconf-set-selections 
RUN apt-get install -y mysql-server --no-install-recommends
RUN echo "user = mysql" >> /etc/mysql/mysql.conf.d/mysqld.cnf && \
echo "skip-log-bin" >> /etc/mysql/mysql.conf.d/mysqld.cnf && \
 rm -f /var/run/mysqld/mysql* && \
 chown -R mysql. /var/run/mysqld && \
 chown -R mysql. /var/lib/mysql && \
 chown -R mysql. /var/log/mysql 
ENTRYPOINT /usr/sbin/mysqld
