#!/usr/bin/env bash

# Install or update composer
if test ! $(which composer); then
    echo "Installing composer ..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    if [ ! -d "/usr/local/bin/" ]; then
        mkdir -p "/usr/local/bin"
    fi
    mv composer.phar /usr/local/bin/composer
    echo "Composer installed!"
else
    echo "Composer already installed"
    echo "Updating composer ..."
    composer self-update
fi