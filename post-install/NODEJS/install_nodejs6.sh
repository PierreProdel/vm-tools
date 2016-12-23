#!/bin/bash

echo Installing NodeJS

sudo echo "> Test droit sudo [OK]"

# Downloading apt source list and install it
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install
sudo apt-get install -y nodejs build-essential

# Upgrade NPM to last version
sudo npm -g install npm


# All done
echo ---------------------------------------------------------------------------
echo Node `node -v` has been installed
echo Npm `npm -v` has been installed
echo ---------------------------------------------------------------------------
