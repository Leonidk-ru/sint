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
 ca-certificates && \
 curl -O https://repo.mysql.com/mysql-apt-config_0.8.20-1_all.deb && \
 echo mysql-apt-config	mysql-apt-config/select-server	select	mysql-8.0 | debconf-set-selections && \
 echo mysql-apt-config	mysql-apt-config/select-product	select	Apply | debconf-set-selections && \
 dpkg -i mysql-apt-config* && \
 apt-get update && \
 echo mysql-server	mysql-server/root-pass password $MYSQL_ROOT_PASSWORD | debconf-set-selections && \
 echo mysql-server	mysql-server/re-root-pass	password $MYSQL_ROOT_PASSWORD | debconf-set-selections && \
 apt-get install -y mysql-server 

RUN  curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
| tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null && \
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
| tee /etc/apt/sources.list.d/nginx.list && \
apt update && \
apt install -y nginx=1.20.2-1~buster

RUN curl https://packages.sury.org/php/apt.gpg > /etc/apt/trusted.gpg.d/php.gpg && \
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
apt update && \
apt install -y php7.4 
RUN apt install -y php7.4-mysql \
 php7.4-dom \
 php7.4-mbstring\
 php7.4-zip \
 php7.4-xml

RUN curl -L https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz | tar xvz  -C /usr/share/ && \
 mv /usr/share/phpM* /usr/share/phpmyadmin && \
chown -R www-data. /usr/share/phpmyadmin

RUN curl -L https://wordpress.org/latest.tar.gz | tar xvz  -C /var/www && \
chown -R www-data. /var/www/wordpress

CMD ["/usr/sbin/mysqld --user=root --daemonize=TRUE"]
