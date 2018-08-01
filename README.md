# docker-ubuntu16-nginx-php7
A docker image based on Ubuntu 16.04 with Nginx + PHP 7.0 (FPM) that uses supervisor as process manager.

## Pull the image

Pull the latest stable version from the [Docker Hub Registry](https://hub.docker.com/r/francarmona/docker-ubuntu16-nginx-php7/)
```
docker pull francarmona/docker-ubuntu16-nginx-php7:latest
```

If you prefer building the image from source, clone the repository and run docker build

```
git clone https://github.com/franCarmona/docker-ubuntu16-nginx-php7.git
docker build -t francarmona/docker-ubuntu16-nginx-php7 .
```

## Run

After building the image, run the container.
```
docker run --name nginx-php7-fpm -v ~/path/to/code:/var/www/html -d -p [host-port]:80 francarmona/docker-ubuntu16-nginx-php7
```
Browse to [http://localhost:[host-port]](http://localhost:[host-port]) to view your app.

## Use as a base image

Some cases will be necessary to create a new image using this one as the base, for example to overwrite configuration files.

Create a Dockerfile with following content and then build the image.

```Dockerfile
FROM francarmona/docker-ubuntu16-nginx-php7

MAINTAINER Your Name <your@email>

# Nginx site conf
ADD config/nginx/nginx-site.conf /etc/nginx/sites-available/default
ADD config/nginx/nginx.conf /etc/nginx/nginx.conf
```


## Exposed ports

80 (http). HTTPS is not enabled in this image.

## Exposed volumes

 - webroot: `/var/www/html`
 
## Out of the box

 * Ubuntu 16.04 LTS
 * Nginx
 * PHP7
 * Git
 * Composer
