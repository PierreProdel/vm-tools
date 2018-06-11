#!/bin/bash

clear
echo "- Installing Android studio"
install_folder=/usr/lib

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

echo "- Installing unzip via apt-get"
sudo apt-get install unzip

echo "- Downloading Android Studio"
wget https://dl.google.com/dl/android/studio/ide-zips/3.1.3.0/android-studio-ide-173.4819257-linux.zip -O as.zip
echo "- Unpacking Android Studio"
sudo unzip as.zip -d ${install_folder}
rm as.zip

echo Linking command
# Create links for command
if [ -f /usr/bin/android-studio ]
then
  sudo rm /usr/bin/android-studio
fi
sudo ln -sfn ${install_folder}/android-studio/bin/studio.sh /usr/bin/android-studio

echo "- Installing android studio dependencies"
sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6 -y

echo "- Creates shortcut"
sudo touch /usr/share/applications/android-studio.desktop
sudo bash -c "cat > /usr/share/applications/android-studio.desktop" <<EOL
[Desktop Entry]
Version=2.3
Type=Application
Name=Android Studio
Icon=${install_folder}/android-studio/bin/studio.png
Exec="/usr/bin/android-studio" %f
Categories=Development;IDE;
Terminal=false
StartupWMClass=android-studio
EOL

# All done
echo ---------------------------------------------------------------------------
echo To continue, edit ~/.bashrc and add or edit the following line:
echo export ANDROID_HOME=/home/sogeti/Android/Sdk
echo export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
echo To start Android studio, look in the menu, or use the command:
echo '$ android-studio &'
echo ---------------------------------------------------------------------------
