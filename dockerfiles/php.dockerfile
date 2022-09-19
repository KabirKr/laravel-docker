FROM php:8.1-fpm

ARG NODE_VERSION=16

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm install -g npm@latest


COPY . .

