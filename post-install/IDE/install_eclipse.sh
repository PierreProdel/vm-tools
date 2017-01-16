#!/bin/bash

echo Installing Eclipse

sudo echo "> Test droit sudo [OK]"

# Download and install
wget http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
tar zxvf eclipse.tar.gz
sudo cp -rf eclipse /usr/lib/eclipse-neon
rm -f eclipse.tar.gz
rm -rf eclipse

# Creates link for command
if [ -f /usr/bin/eclipse ]
then
  sudo rm -f /usr/bin/eclipse
fi
sudo ln -s /usr/lib/eclipse-neon/eclipse /usr/bin/eclipse

# Tries to create desktop shortcut (does not work)
echo "- Creates shortcut"
sudo touch /usr/share/applications/eclipse.desktop
sudo bash -c "cat > /usr/share/applications/eclipse.desktop" <<EOL
[Desktop Entry]
Version=Neon
Type=Application
Name=Eclipse Neon
Icon=/usr/lib/eclipse-neon/icon.xpm
Exec="/usr/bin/eclipse" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=Eclipse
EOL

# All done
echo ---------------------------------------------------------------------------
echo To start eclipse, look in the menu, or use the command:
echo $ eclipse&
echo ---------------------------------------------------------------------------
