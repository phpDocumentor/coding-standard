FROM php:7.4.7-alpine

COPY --from=composer:1.8.4 /usr/bin/composer /usr/local/bin/composer

COPY . /opt/phpdoc
RUN cd /opt/phpdoc && composer install \
    && echo "memory_limit=1024M" >> /usr/local/etc/php/conf.d/phpdoc.ini

ENTRYPOINT ["/opt/phpdoc/entrypoint.sh"]
CMD ["--help"]
