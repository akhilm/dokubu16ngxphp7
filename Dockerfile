FROM ubuntu:16.04
MAINTAINER Akhil Kumar Maheshwari <akhu.gset@gmail.com>

# Environments vars
ENV TERM=xterm

RUN apt-get update
RUN apt-get -y upgrade

# Packages installation
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install php \
      php-cli \
      php-fpm \
      php-gd \
      php-json \
      php-mbstring \
      php-xml \
      php-xsl \
      php-zip \
      php-soap \
      php-pear \
      curl \
      php-curl \
      php-mcrypt \
      php-redis \
      apt-transport-https \
      vim \
      lynx-cur

# Install supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install supervisor
RUN mkdir -p /var/log/supervisor

# Install nginx (full)
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nginx-full

# Composer install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Nginx site conf
ADD config/nginx/nginx-site.conf /etc/nginx/sites-available/default
ADD config/nginx/nginx.conf /etc/nginx/nginx.conf

# PHP conf
ADD config/php/php.ini /etc/php/7.0/fpm/php.ini
ADD config/fpm/www.conf /etc/php/7.0/fpm/pool.d/www.conf

# Supervisor conf
ADD config/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


ADD html /var/www/html 

WORKDIR /var/www/html/

# Create socket
RUN mkdir -p /run/php \
    && chown -R www-data:www-data /var/www/html

# Volume
VOLUME /var/www/html

# Ports: nginx
EXPOSE 80
#443

CMD ["/usr/bin/supervisord"]
