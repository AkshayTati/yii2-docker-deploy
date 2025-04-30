FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git \
    && docker-php-ext-install pdo pdo_mysql zip

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

RUN sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/html/web|" /etc/apache2/sites-available/000-default.conf

