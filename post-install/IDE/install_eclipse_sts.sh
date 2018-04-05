#!/bin/bash

clear
echo Installing Eclipse

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
wget download.springsource.com/release/STS/3.9.3.RELEASE/dist/e4.7/spring-tool-suite-3.9.3.RELEASE-e4.7.3-linux-gtk-x86_64.tar.gz -O eclipse.sts.tar.gz
mkdir -p /home/sogeti/ide/eclipse/eclipse-sts-3.9.3
tar zxvf eclipse.sts.tar.gz
cp -rf sts-bundle /home/sogeti/ide/eclipse/eclipse-sts-3.9.3
rm -rf sts-bundle
rm -f eclipse.sts.tar.gz
cp eclipse-sts-3.9.3.desktop /home/sogeti/Bureau

# All done
echo ---------------------------------------------------------------------------
echo -e "Eclipse STS 3.9.3 installed"
echo ---------------------------------------------------------------------------
