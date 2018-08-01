#!/bin/bash

#/usr/sbin/service php7.0-fpm start
/usr/sbin/php-fpm7.0 -F
#/usr/sbin/service nginx start
/usr/sbin/nginx -g 'daemon off;'

