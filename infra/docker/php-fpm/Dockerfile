FROM php:7.1.6-fpm-alpine

MAINTAINER Vladyslav Bilyi <beliyvladislav@gmail.com>

WORKDIR /var/www/example

# Install dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update \
    libjpeg-turbo \
    jpeg-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libpng \
    freetype-dev \
    libmcrypt-dev \
    curl \
    git \
    mysql-client

# Install and configure extentions
RUN docker-php-ext-install gd pdo_mysql opcache iconv mcrypt mbstring zip && \
    docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/

# Apply our PHP configs
COPY ./infra/docker/php-fpm/conf.d $PHP_INI_DIR/conf.d

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Expose needed ports
EXPOSE 9000

CMD ["php-fpm"]
