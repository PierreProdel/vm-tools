#!/bin/bash

# First update
echo "Global update! Go grab a coffee"
sudo apt-get update
sudo apt-get -y upgrade
echo "Nice, now we can do some stuff..."

# VMWare tools
echo "Installing Open VM Tools..."
sudo apt-get -y install open-vm-tools-desktop
echo "Open VM Tools installed installed."

# Useful tools
echo "Installing important tools"
sudo apt-get -y install curl less dos2unix
echo "Tools installed"

# Docker
echo "Installing Docker..."
echo "Removing old docker installation first."
sudo apt-get -y purge "lxc-docker*"
sudo apt-get -y purge "docker.io*"
echo "Now getting the real thing."
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get install docker-engine
sudo groupadd docker
username=`whoami`
sudo gpasswd -a $username docker
sudo service docker start
echo "And Docker-Compose 1.9.0 (Check if there's any update)."
# Check here : https://docs.docker.com/compose/install/
sudo curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo cp ./docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Docker installed."

# Geany
echo "Installing Geany (nice text editor)"
sudo apt-get -y install geany
echo "Geany installed."

# Atom
echo "Installing Atom (another nice text editor)"
wget https://atom.io/download/deb -O atom-amd64.deb
sudo dpkg -i atom-amd64.deb
sudo apt-get -y -f install
echo "Atom installed."

# Keepass
echo "Installing Keepass2"
sudo apt-get -y install keepass2
echo "Keepass2 installed"

# KeeWeb
echo "Installing KeeWeb"
wget https://github.com/keeweb/keeweb/releases/download/v1.3.3/KeeWeb-1.3.3.linux.x64.deb
sudo dpkg -i KeeWeb-1.3.3.linux.x64.deb
echo "KeeWeb installed"

# Chrome
echo "Installing Chrome..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable
sudo apt-get -y -f install
echo "Chrome installed."

echo "Installing htop"
sudo apt-get -y install htop
echo "htop installed."
