#!/bin/bash

clear
echo Installing PHP Composer

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo apt-get install -y perl

read -p "You need PHP installed first, which version do you want? [5/7] " choice
choice=${choice:-7}

if [ "$choice" == "7" ]; then
    source ./install_php7.sh
else
    source ./install_php5.sh
fi

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