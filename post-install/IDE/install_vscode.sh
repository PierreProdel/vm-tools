#!/bin/bash

clear
echo Installing Visual Studio Code

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
wget https://az764295.vo.msecnd.net/stable/f9d0c687ff2ea7aabd85fb9a43129117c0ecf519/code_1.9.1-1486597190_amd64.deb -O vscode.deb
sudo dpkg -i vscode.deb
sudo apt-get install -f
rm -f vscode.deb

# All done
echo ---------------------------------------------------------------------------
echo Visual Studio Code installed. You can start it from menu, or with
echo '  $ code'
echo You can execute the following command to set it as default editor
echo '  $ sudo update-alternatives --set editor /usr/bin/code'
echo ---------------------------------------------------------------------------
