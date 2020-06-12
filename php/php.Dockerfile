FROM php:7.4-fpm
WORKDIR /var/www
# COPY --from=composer-install /var/www/vendor /var/www/
# Install system dependencies
RUN apt-get update && apt-get install -y \
         zip \
         unzip \
         libfreetype6-dev \
         libjpeg62-turbo-dev \
   	 libzip-dev \
   	 libpng-dev \
   	 libonig-dev \
   	 libxml2-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install -j$(nproc) gd

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip
RUN sed -i "/^;security.limit_extensions =.*/asecurity.limit_extensions = .php .php7 .php73" /usr/local/etc/php-fpm.d/www.conf
#For Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY upload.ini /usr/local/etc/php/conf.d/upload.ini
COPY 01-security.ini /usr/local/etc/php/conf.d/01-security.ini
