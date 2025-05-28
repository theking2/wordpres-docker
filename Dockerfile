# Source image
FROM wordpress:6.8.1-php8.3-apache
ARG UPLOADS_INI="/usr/local/etc/php/conf.d/uploads.ini"

# Install AND configure Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "upload_max_filesize = 128M" > ${UPLOADS_INI} \
    && echo "post_max_size = 128M" >> ${UPLOADS_INI} 
