FROM composer:2.5.5 as builder

COPY . /opt/phpdoc
WORKDIR /opt/phpdoc

RUN composer install

FROM php:7.4-alpine

COPY --from=builder /opt/phpdoc /opt/phpdoc

RUN echo "memory_limit=1024M" >> /usr/local/etc/php/conf.d/phpdoc.ini

ENTRYPOINT ["/opt/phpdoc/entrypoint.sh"]
CMD ["--help"]
