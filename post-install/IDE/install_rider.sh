#!/bin/bash

clear
echo "- Installing Rider"
install_folder=/usr/lib/rider

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

echo "- Downloading Rider"
wget https://download-cf.jetbrains.com/resharper/riderRS-171.4089.265.tar.gz -O rider.tar.gz
echo "- Unpacking Rider"
sudo mkdir -p $install_folder
mkdir -p tt
tar zxf rider.tar.gz -C ./tt
infolder=`ls tt`
sudo cp -rf tt/$infolder/* $install_folder/
rm -rf tt
rm rider.tar.gz

echo Linking command
# Creates link for command
if [ -f /usr/bin/rider ]
then
  sudo rm /usr/bin/rider
fi
sudo ln -sfn ${install_folder}/bin/rider.sh /usr/bin/rider

# All done
echo ---------------------------------------------------------------------------
echo To start Rider, look in the menu, or use the command:
echo '$ rider &'
echo ---------------------------------------------------------------------------