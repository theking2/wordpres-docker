# Source image
FROM wordpress:6.8-apache

# We're going to use this path multile times. So save it in a variable.
ARG UPLOADS_INI="/usr/local/etc/php/conf.d/uploads.ini"
ARG XDEBUG_INI="/usr/local/etc/php/conf.d/xdebug.ini"

# Install AND configure Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "upload_max_filesize = 128M" > ${UPLOADS_INI} \
    && echo "post_max_size = 128M" >> ${UPLOADS_INI} \
    && echo "[xdebug]" > $XDEBUG_INI \
    && echo "xdebug.mode = debug" >> $XDEBUG_INI \
    && echo "xdebug.start_with_request = trigger" >> $XDEBUG_INI \
    && echo "xdebug.client_host = 'host.docker.internal'" >> $XDEBUG_INI \
    && echo "xdebug.log = /tmp/xdebug.log" >> $XDEBUG_INI
