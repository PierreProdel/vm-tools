#!/usr/bin/env bash
echo "- Installing IntelliJ"
install_folder=/usr/lib

sudo echo "> Test droit sudo [OK]"

# Getting latest release data from https://www.jetbrains.com/updates/updates.xml in products -> IntelliJ IDEA -> IDEA_Release -> 1st build found
build=$(wget -O - https://www.jetbrains.com/updates/updates.xml | grep -C 1 IDEA_Release | grep build)
version=$(echo $build | sed 's/.*version="//' | sed 's/".*//')
fullNumber=$(echo $build | sed 's/.*fullNumber="//' | sed 's/".*//')

echo "- Downloading IntelliJ $version - $fullNumber"
wget https://download.jetbrains.com/idea/ideaIC-${version}.tar.gz
echo "- Unpacking IntelliJ $version - $fullNumber to $install_folder"
sudo tar zxvf ideaIC-${version}.tar.gz -C $install_folder
rm ideaIC-${version}.tar.gz

echo "- Linking folder"
# Creates link for folder
if [ -f ${install_folder}/intellij ]
then
  sudo rm ${install_folder}/intellij
fi
sudo ln -s ${install_folder}/idea-IC-${fullNumber} ${install_folder}/intellij

sudo /bin/bash -c 'echo "svn.executable.locale=C.UTF-8" >> /usr/lib/intellij/bin/idea.properties'

echo Linking command
# Create links for command
if [ -f /usr/bin/idea ]
then
  sudo rm /usr/bin/idea
fi
sudo ln -s ${install_folder}/intellij/bin/idea.sh /usr/bin/idea

echo "- Creates shortcut"
sudo touch /usr/share/applications/intellij.desktop
sudo bash -c "cat > /usr/share/applications/intellij.desktop" <<EOL
[Desktop Entry]
Version=${version}
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=${install_folder}/intellij/bin/idea.png
Exec="/usr/bin/idea" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea-ce
EOL

echo "- Below lines show previous installations you may want to remove"
ls -l ${install_folder}/idea-IC-* | grep -v ${fullNumber}

# All done
echo ---------------------------------------------------------------------------
echo To start IntelliJ, look in the menu, or use the command:
echo '$ idea &'
echo ---------------------------------------------------------------------------
