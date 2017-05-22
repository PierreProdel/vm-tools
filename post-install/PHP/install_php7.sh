#!/bin/bash

clear
echo Installing PHP 7

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

read -p "Remove PHP5?: [y/n] " choice
choice=${choice:-y}

if [ "$choice" == "y" ]; then
    sudo apt-get remove -y php5*
fi

sudo sh -c 'echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list'
wget -O- https://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
sudo apt update

sudo apt-get install -y php7.0-cli php7.0-redis php7.0-mongodb php7.0-curl php7.0-json php7.0-xdebug php7.0-dev php7.0-readline php7.0-mbstring php7.0-xml

# All done
echo ---------------------------------------------------------------------------
echo PHP 7 is installed
echo `php -v`
echo ---------------------------------------------------------------------------

