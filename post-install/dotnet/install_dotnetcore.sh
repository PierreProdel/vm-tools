#!/bin/bash

clear
echo "- Installing .NET core"

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo apt-get install -y curl libunwind8 gettext
echo "Downloading dotnet core..."
curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?linkid=843453
echo "Installing dotnet core..."
sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet
rm -f dotnet.tar.gz

if [ ! -f /usr/local/bin/dotnet ]
then
  sudo ln -s /opt/dotnet/dotnet /usr/local/bin
fi

# All done
echo ---------------------------------------------------------------------------
echo .NET core `dotnet --version` is installed
echo ---------------------------------------------------------------------------
