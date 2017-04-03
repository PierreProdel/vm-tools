#!/bin/bash

clear
echo Installing PHP Composer

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo apt-get install -y perl php5-cli

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === \"$EXPECTED_SIGNATURE\") { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
php -r "unlink('composer-setup.php');"

# All done
echo ---------------------------------------------------------------------------
echo Composer is installed. Use:
echo $ composer
echo ---------------------------------------------------------------------------