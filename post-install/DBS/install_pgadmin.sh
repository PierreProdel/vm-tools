#!/bin/bash

clear
echo Installing PgAdmin3

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get -y install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install pgadmin3

# All done
echo ---------------------------------------------------------------------------
echo Done.
echo ---------------------------------------------------------------------------
