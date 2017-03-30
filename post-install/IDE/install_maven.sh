#!/bin/bash

clear
echo Installing Maven

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download the Apache Maven
wget http://apache.spinellicreations.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

#Extract the Tar.Gz File
tar -xvzf apache-maven-3.3.9-bin.tar.gz
sudo cp -rf apache-maven-3.3.9 /opt/
rm -rf apache-maven-3.3.9-bin.tar.gz apache-maven-3.3.9

# Creates link
if [ -f /opt/maven ]
then
  sudo rm /opt/maven
fi
sudo ln -s /opt/apache-maven-3.3.9 /opt/maven

# All done
echo ---------------------------------------------------------------------------
echo To continue, edit ~/.bashrc and add or edit the following line:
echo export M2_HOME=/opt/apache-maven-3.3.9
echo export M2=$M2_HOME/bin
echo export PATH=$M2:$PATH
echo ---------------------------------------------------------------------------
