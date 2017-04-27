#!/bin/bash

clear
echo Installing ZAP

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo echo 'deb http://download.opensuse.org/repositories/home:/cabelo/Debian_8.0/ /' > /etc/apt/sources.list.d/owasp-zap.list 
sudo apt-get update
sudo apt-get install owasp-zap

# Create desktop shortcut (does not work)
echo "- Creates shortcut"
sudo touch /usr/share/applications/zap.desktop
sudo bash -c "cat > /usr/share/applications/zap.desktop" <<EOL
[Desktop Entry]
Version=Stable
Type=Application
Name=OWASP ZAP
Icon=/usr/share/owasp-zap/zap.ico
Exec="/usr/share/owasp-zap/zap.sh"
Comment=The Drive to penetrate
Categories=Development;IDE;
Terminal=false
StartupWMClass="sun-awt-X11-XFramePeer", "OWASP ZAP"
EOL

# All done
echo ---------------------------------------------------------------------------
echo ZAP installed and integrated in launch menu
echo ---------------------------------------------------------------------------
