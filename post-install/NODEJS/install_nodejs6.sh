#!/bin/bash

clear
echo Installing NodeJS

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Downloading apt source list and install it
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install
sudo apt-get install -y nodejs build-essential

# Upgrade NPM to last version
sudo npm -g install npm

# Install npm essential tools
sudo npm install -g grunt
sudo npm install -g bower

# All done
echo ---------------------------------------------------------------------------
echo node `node -v` has been installed
echo npm `npm -v` has been installed
echo bower `bower -v` has been installed
echo ---------------------------------------------------------------------------
