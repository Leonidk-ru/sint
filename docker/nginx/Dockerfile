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

COPY config/nginx.conf /etc/nginx/nginx.conf
CMD chown -R www-data. /var/log/nginx
ENTRYPOINT  nginx -g "daemon off;"
