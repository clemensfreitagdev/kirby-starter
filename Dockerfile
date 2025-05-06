FROM webdevops/php-apache-dev:8.1

COPY ./assets /app/assets
COPY ./content /app/content
COPY ./site /app/site

COPY ./composer.json /app
COPY ./.htaccess /app
COPY ./index.php /app
COPY ./favicon.ico /app

# /kirby and /vendor are installed via composer

WORKDIR /app

RUN chown -R application:application /app/

RUN composer install

