FROM php:8.1-fpm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor \
        nginx \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libssl-dev \
        libzip-dev \
        unzip \
        zip \
    && apt-get clean \
    && pecl install redis \
    && docker-php-ext-configure gd \
    && docker-php-ext-configure zip \
    && docker-php-ext-install \
        gd \
        exif \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        pcntl \
        zip \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*;
    
# Install Composer
ENV COMPOSER_VERSION 2.5.4

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION


COPY . .

COPY docker/conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./docker/conf/laravel.ini /usr/local/etc/php/conf.d/laravel.ini


RUN chmod -R 755 ./storage \
    && chmod -R 755 ./bootstrap/cache


ENTRYPOINT ["bash","./php/entrypoint.sh"]
