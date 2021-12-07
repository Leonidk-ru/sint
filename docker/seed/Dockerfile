FROM debian:10
RUN apt-get update && \
  apt-get -y install curl 
RUN rm -rf /usr/share/phpmyadmin && \
  curl https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz | tar xz -C /usr/share && \
  mv /usr/share/phpMyAdmin-5.1.1-all-languages /usr/share/phpmyadmin
COPY config/config.inc.php /usr/share/phpmyadmin
RUN mkdir /var/www && \
  curl https://wordpress.org/wordpress-5.8.2.tar.gz| tar xz -C /var/www
COPY config/wp-config.php /var/www/wordpress
