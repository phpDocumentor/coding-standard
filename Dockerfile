FROM php:7.3-alpine

COPY --from=composer:1.8.4 /usr/bin/composer /usr/local/bin/composer

COPY . /opt/phpdoc
RUN cd /opt/phpdoc && composer install

ENTRYPOINT ["/opt/phpdoc/entrypoint.sh"]
CMD ["--help"]
