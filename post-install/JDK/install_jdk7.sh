#!/bin/bash

clear
echo Installing Oracle JDK 1.7

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Downloading with licence accepting
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz

# Install
tar zxvf jdk-7u79-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo rm -rf /usr/lib/jvm/jdk-1.7.0_79-oracle
sudo cp -rf jdk1.7.0_79 /usr/lib/jvm/jdk-1.7.0_79-oracle
rm -rf jdk1.7.0_79
rm -f jdk-7u79-linux-x64.tar.gz
sudo ln -s /usr/lib/jvm/jdk-1.7.0_79-oracle /usr/lib/jvm/jdk7

# Integrates Java as default JRE/JDK
echo Updating default Java to Oracle
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk7/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk7/bin/javac" 1
echo Now select Oracle Java in the next menu
sudo update-alternatives --config java
echo Now select Oracle Java in the next menu
sudo update-alternatives --config javac

# All done
echo ---------------------------------------------------------------------------
echo -e "To continue, edit \033[1m~/.bashrc_perso\033[0m and add or edit the following line:"
echo -e "\033[31;1mexport JAVA_HOME=/usr/lib/jvm/jdk7\033[0m"
echo ---------------------------------------------------------------------------
