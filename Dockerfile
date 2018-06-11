FROM wordpress:php7.1-apache

ENV XDEBUG_PORT 9000

RUN yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_host = \"host.docker.internal\"" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.default_enable = 1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart = 1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_handler = \"dbgp\"" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_port = 9000" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.var_display_max_depth = -1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.var_display_max_children = -1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.var_display_max_data = -1" >> /usr/local/etc/php/conf.d/xdebug.ini

EXPOSE 9000
