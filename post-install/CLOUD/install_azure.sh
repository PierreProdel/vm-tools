#!/bin/bash

clear
echo Installing Azure CLI

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo apt-get install -y python3

echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
sudo apt-get install -y apt-transport-https
sudo apt-get update && sudo apt-get install -y azure-cli

# All done
echo ---------------------------------------------------------------------------
echo azure-cli is installed
echo ---------------------------------------------------------------------------
