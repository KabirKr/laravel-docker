FROM php:8.1-fpm

RUN apt update \
    && apt install libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Nodejs install
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -

RUN apt update \
    && apt install nodejs

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY . .

