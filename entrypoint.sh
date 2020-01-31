#!/bin/sh -l
if [ "$1" = 'phpcbf' ]; then
    COMMAND=$(echo "${*}" | cut -c 8-)
    sh -c "/opt/phpdoc/vendor/bin/phpcbf ${COMMAND}"
else
    sh -c "/opt/phpdoc/vendor/bin/phpcs $*"
fi
