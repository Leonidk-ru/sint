FROM debian:10
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

RUN mkdir /usr/share/phpmyadmin 
RUN ls -l /usr/share
RUN curl -L https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz | tar xvz  -C /usr/share/ 
COPY config/config.inc.php /usr/share/phpmyadmin
RUN mkdir /var/www && \
curl -L https://wordpress.org/wordpress-5.8.2.tar.gz| tar xvz -C /var/www 
COPY config/wp-config.php /var/www/wordpress


