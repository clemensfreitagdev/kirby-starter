FROM webdevops/php-apache-dev:8.1

COPY ./composer.json /app
COPY ./.htaccess /app
COPY ./index.php /app
COPY ./favicon.ico /app

WORKDIR /app
RUN composer install

