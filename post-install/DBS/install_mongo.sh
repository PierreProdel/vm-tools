#!/bin/bash

clear
echo Installing Mongo client

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install mongodb-org-shell mongodb-org-tools

echo Installing Robomongo

wget https://download.robomongo.org/1.0.0/linux/robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz -O robomongo.tar.gz
tar zxvf robomongo.tar.gz
rm -f robomongo.tar.gz
untar_folder=`ls | grep robomongo`

sudo cp -rf $untar_folder /usr/lib/
if [ -f /usr/lib/robomongo ]
then
  sudo rm -f /usr/lib/robomongo
fi
sudo ln -s /usr/lib/$untar_folder /usr/lib/robomongo

if [ ! -f /usr/bin/robomongo ]
then
  sudo ln -s /usr/lib/robomongo/bin/robomongo /usr/bin/robomongo
fi

rm -rf $untar_folder

echo "- Creates shortcut"
sudo touch /usr/share/applications/robomongo.desktop
sudo bash -c "cat > /usr/share/applications/robomongo.desktop" <<EOL
[Desktop Entry]
Version=0.9.0
Type=Application
Name=Robomongo
Icon=/usr/share/icons/gnome/256x256/apps/multimedia.png
Exec="/usr/bin/robomongo"
Comment=The Drive to Develop
Categories=Development;Database;
Terminal=false
StartupWMClass=robomongo
EOL

# All done
echo ---------------------------------------------------------------------------
echo Done. Only clients are installed. Server must be in a docker container.
echo ---------------------------------------------------------------------------
