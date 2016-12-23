#!/bin/bash

echo Installing Eclipse

sudo echo "> Test droit sudo [OK]"

# Download and install
wget http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
tar zxvf eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
sudo cp -rf eclipse /usr/lib/eclipse-neon
rm -f eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
rm -rf eclipse

# Creates link for command
if [ -f /usr/bin/eclipse ]
then
  sudo rm /usr/bin/eclipse
fi
sudo ln -s /usr/lib/eclipse-neon/eclipse /usr/bin/eclipse

# Tries to create desktop shortcut (does not work)
sudo bash -c "cat > /usr/share/applications/eclipse.desktop" <<EOL
[Desktop Entry]
Encoding=UTF-8
Exec=eclipse
Icon=/usr/lib/eclipse-neon/eclipse/icon.xpm
Type=Application
Terminal=false
Comment=eclipse Integrated Development Environment
Name=eclipse
GenericName=eclipse
StartupNotify=false
Categories=Development;IDE;Java;
EOL

# All done
echo ---------------------------------------------------------------------------
echo To start eclipse, look in the menu, use the command:
echo $ eclipse&
echo ---------------------------------------------------------------------------
