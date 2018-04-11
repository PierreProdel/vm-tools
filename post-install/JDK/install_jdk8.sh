#!/bin/bash

clear
echo Installing Oracle JDK 1.8

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Downloading with licence accepting
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz -O jdk-8u162-linux-x64.tar.gz

# Install
tar zxvf jdk-8u162-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo rm -rf /usr/lib/jvm/jdk-1.8.0_162-oracle
sudo cp -rf jdk1.8.0_162 /usr/lib/jvm/jdk-1.8.0_162-oracle
rm -rf jdk1.8.0_162
rm -f jdk-8u162-linux-x64.tar.gz
sudo rm -f /usr/lib/jvm/jdk8
sudo ln -s /usr/lib/jvm/jdk-1.8.0_162-oracle /usr/lib/jvm/jdk8

# Integrates Java as default JRE/JDK
echo Updating default Java to Oracle
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk8/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk8/bin/javac" 1
echo Now select Oracle Java in the next menu
sudo update-alternatives --config java
echo Now select Oracle Java in the next menu
sudo update-alternatives --config javac

# All done
echo ---------------------------------------------------------------------------
echo -e "To continue, edit \033[1m~/.bashrc_perso\033[0m and add or edit the following lines:"
echo -e "\033[31;1mexport JAVA_HOME=/usr/lib/jvm/jdk8\033[0m"
echo -e "\033[31;1mexport PATH=${PATH}:${JAVA_HOME}/bin"
echo -e "or play following commands"
echo -e 'echo "export JAVA_HOME=/usr/lib/jvm/jdk8\" >> ~/.bashrc_perso'
echo -e 'echo "export PATH=${PATH}:${JAVA_HOME}/bin\" >> ~/.bashrc_perso'
echo ---------------------------------------------------------------------------
