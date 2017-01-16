#!/bin/bash

echo Installing Apache Directory Studio

sudo echo "> Test droit sudo [OK]"

# Download and install
wget http://apache.mindstudios.com/directory/studio/2.0.0.v20161101-M12/ApacheDirectoryStudio-2.0.0.v20161101-M12-linux.gtk.x86_64.tar.gz -O ads.tar.gz
tar zxvf ads.tar.gz
sudo cp -rf ApacheDirectoryStudio /usr/lib/ApacheDirectoryStudio
rm -f ads.tar.gz
rm -rf ApacheDirectoryStudio

# Creates link for command
if [ -f /usr/bin/ads ]
then
  sudo rm /usr/bin/ads
fi
sudo ln -s /usr/lib/ApacheDirectoryStudio/ApacheDirectoryStudio /usr/bin/ads

echo "- Creates shortcut"
sudo touch /usr/share/applications/ads.desktop
sudo bash -c "cat > /usr/share/applications/ads.desktop" <<EOL
[Desktop Entry]
Version=WTF
Type=Application
Name=Apache Directory Studio
Icon=/usr/lib/ApacheDirectoryStudio/icon.xpm
Exec="/usr/bin/ads" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=Apache Directory Studio
EOL

# All done
echo ---------------------------------------------------------------------------
echo To start Apache Directory Studio, look in the menu, or use the command:
echo $ ads&
echo ---------------------------------------------------------------------------
