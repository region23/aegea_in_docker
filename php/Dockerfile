FROM php:7.3-fpm-alpine
LABEL maintainer "Pavel Pavlenko <region23@gmail.com>"

RUN apk update && apk upgrade

RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev && \
  docker-php-ext-configure gd \
  --with-gd \
  --with-freetype-dir=/usr/include/ \
  --with-png-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
  docker-php-ext-install -j${NPROC} gd && \
  apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

RUN docker-php-source extract
RUN docker-php-ext-install mysqli pdo_mysql mbstring

RUN apk add --no-cache zlib-dev libzip-dev
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install zip
RUN apk del --no-cache zlib-dev libzip-dev

RUN mkdir -p /usr/local/etc/php/conf.d
COPY conf.d/settings.ini /usr/local/etc/php/conf.d/settings.ini

RUN mkdir -p /var/www/blog
