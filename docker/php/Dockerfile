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
RUN  curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
	| tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null && \
	echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
	http://nginx.org/packages/debian `lsb_release -cs` nginx" \
	| tee /etc/apt/sources.list.d/nginx.list && \
	apt update && \
	apt install -y nginx=1.20*

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

COPY config/nginx.conf /etc/nginx/nginx.conf

RUN curl -L https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz | tar xvz  -C /usr/share/ && \
 mv /usr/share/phpM* /usr/share/phpmyadmin && \
chown -R www-data. /usr/share/phpmyadmin

#RUN curl -L https://wordpress.org/latest.tar.gz | tar xvz  -C /var/www && \
#chown -R www-data. /var/www/wordpress
RUN echo "exit 0" > /usr/sbin/policy-rc.d
CMD /etc/init.d/php7.4-fpm start && nginx -g "daemon off;"
#CMD ["nginx", "-g", "daemon off;"]
