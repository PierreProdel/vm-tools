#!/bin/bash

clear
echo Installing PHP 5

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

read -p "Remove PHP7?: [y/n] " choice
choice=${choice:-y}

if [ "$choice" == "y" ]; then
    sudo apt-get remove -y php7*
fi

sudo apt-get install -y php5 php5-cgi php5-cli php5-common php5-curl php5-dev php5-json php5-readline

# All done
echo ---------------------------------------------------------------------------
echo PHP 5 is installed
echo `php -v`
echo ---------------------------------------------------------------------------
