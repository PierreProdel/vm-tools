#!/bin/bash

clear
echo Installing Firefox

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

outfolder=~/firefox

# Download and install
wget -L -O firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64'
tar xf firefox.tar.bz2
sudo mkdir -p $outfolder
sudo rm -rf $outfolder
sudo cp -rf firefox $outfolder
rm -rf firefox.tar.bz2 firefox

# Creates link for command
if [ -f /usr/bin/firefox-latest ]
then
  sudo rm -f /usr/bin/firefox-latest
fi
sudo ln -s $outfolder/firefox /usr/bin/firefox-latest

## Tries to create desktop shortcut (does not work)
echo "- Creates shortcut"
sudo touch /usr/share/applications/firefox-latest.desktop
sudo bash -c "cat > /usr/share/applications/firefox-latest.desktop" <<EOL
[Desktop Entry]
Name=Firefox Latest
Comment=Browse the World Wide Web
GenericName=Web Browser
X-GNOME-FullName=Firefox Latest Web Browser
Exec=$outfolder/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=$outfolder/firefox
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Firefox
StartupNotify=true
EOL

# All done
echo ---------------------------------------------------------------------------
echo To start Firefox, look in the menu, or use the command:
echo $ firefox-latest&
echo ---------------------------------------------------------------------------
