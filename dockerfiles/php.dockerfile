FROM php:8.1-fpm-alpine

RUN apk update \
    && apk add libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY . .

