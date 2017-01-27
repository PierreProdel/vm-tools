#!/bin/bash

echo Installing Android Studio

sudo echo "> Test droit sudo [OK]"

# Download and install
wget https://dl.google.com/dl/android/studio/ide-zips/2.2.3.0/android-studio-ide-145.3537739-linux.zip -O ads.zip
unzip ads.zip
sudo cp -rf android-studio /usr/lib/android-studio
rm -f ads.zip
rm -rf android-studio

# Creates link for command
if [ -f /usr/bin/android-studio ]
then
  sudo rm -f /usr/bin/android-studio
fi
sudo ln -s /usr/lib/android-studio/bin/studio.sh /usr/bin/android-studio

# Tries to create desktop shortcut (does not work)
echo "- Creates shortcut"
sudo touch /usr/share/applications/ads.desktop
sudo bash -c "cat > /usr/share/applications/ads.desktop" <<EOL
[Desktop Entry]
Version=2.2.3
Type=Application
Name=Android Studio
Icon=/usr/lib/android-studio/bin/studio.png
Exec="/usr/bin/android-studio"
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-studio
EOL

# All done
echo ---------------------------------------------------------------------------
echo To start Android sStudio, look in the menu, or use the command:
echo $ android-studio&
echo ---------------------------------------------------------------------------
