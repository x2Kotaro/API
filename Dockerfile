FROM php:8.2-fpm

RUN docker-php-ext-install mysqli pdo pdo_mysql

# copy project
COPY . /var/www/html
WORKDIR /var/www/html

CMD ["php", "-S", "0.0.0.0:10000", "-t", "/var/www/html"]
