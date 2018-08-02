#!/bin/bash
set -e

#/usr/sbin/service php7.0-fpm start
/usr/sbin/php-fpm7.0 -F
#/usr/sbin/service nginx start
#exec "nginx" -g "daemon off;"

