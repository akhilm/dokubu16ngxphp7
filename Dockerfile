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

WORKDIR /var/www/html/

# Create socker
RUN mkdir -p /run/php

# Volume
VOLUME /var/www/html

# Ports: nginx
EXPOSE 80
#443
