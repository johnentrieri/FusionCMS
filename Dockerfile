FROM php:8.3-apache

# Install dependencies required to compile the PHP extensions listed in the prerequisites table
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libicu-dev \
    libgmp-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mysqli gd mbstring xml curl soap intl gmp zip

# Enable required Apache modules from the prerequisites list
RUN a2enmod rewrite headers expires deflate filter

WORKDIR /var/www/html

EXPOSE 80
