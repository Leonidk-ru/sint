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

RUN curl https://packages.sury.org/php/apt.gpg > /etc/apt/trusted.gpg.d/php.gpg && \
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
apt update && \
apt install -y php7.4 \
 php7.4-fpm  \
 php7.4-mysql \
 php7.4-dom \
 php7.4-fpm \
 php7.4-mbstring\
 php7.4-zip \
 php7.4-xml


#CMD mkdir /usr/share/phpmyadmin
#CMD mkdir /var/www/wordpress
COPY docker/php/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
#COPY config/config.inc.php /usr/share/phpmyadmin
#COPY config/wp-config.php /var/www/wordpress

#CMD mkdir /var/log/php-fpm 
#CMD chown -R www-data. /usr/share/phpmyadmin



#CMD chown -R www-data. /var/www/wordpress
CMD php-fpm7.4 -F
#COPY config/config.inc.php /usr/share/phpmyadmin
#RUN mkdir /var/www && \
#COPY config/wp-config.php /var/www/wordpress
