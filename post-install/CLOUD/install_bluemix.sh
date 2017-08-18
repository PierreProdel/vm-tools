#!/bin/bash

clear
echo Installing Bluemix CLI

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

#curl -fsSL https://clis.ng.bluemix.net/install/linux -o bx.sh
#sudo sh bx.sh
#rm -f bx.sh

echo Installing IBM Bluemix Container Service Plug-in
bx plugin install IBM-Containers -r Bluemix

bx plugin list
