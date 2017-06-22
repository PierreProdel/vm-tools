#!/bin/bash

clear
echo "- Installing Docker"

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Docker
echo "Removing old docker installation first."
sudo apt-get -y purge "lxc-docker*"
sudo apt-get -y purge "docker.io*"
sudo apt-get -y purge "docker"
sudo apt-get -y purge "docker-engine"

echo "Now getting the real thing."
# from https://docs.docker.com/engine/installation/linux/debian/#install-using-the-repository
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce

echo "Setup docker for non root user"
sudo groupadd docker
username=`whoami`
sudo gpasswd -a $username docker
sudo service docker start

echo "Install docker-compose 1.14.0 (Check if there's any update)."
# Check here : https://github.com/docker/compose/releases
# Initial link : https://docs.docker.com/compose/install
dockerComposeVersion=1.14.0
sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo cp ./docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo rm -f ./docker-compose

# All done
echo ---------------------------------------------------------------------------
echo `docker --version` is installed
echo `docker-compose --version` is installed
echo A reboot is required though...
echo ---------------------------------------------------------------------------