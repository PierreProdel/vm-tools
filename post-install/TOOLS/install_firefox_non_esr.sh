#!/bin/bash

clear
echo Installing Firefox

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
wget -L -O firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64'
tar xf firefox.tar.bz2
sudo mkdir -p /usr/lib/firefox-latest
sudo rm -rf /usr/lib/firefox-latest
sudo cp -rf firefox /usr/lib/firefox-latest
rm -f firefox.tar.bz2

# Creates link for command
if [ -f /usr/bin/firefox-latest ]
then
  sudo rm -f /usr/bin/firefox-latest
fi
sudo ln -s /usr/lib/firefox-latest/firefox /usr/bin/firefox-latest

## Tries to create desktop shortcut (does not work)
echo "- Creates shortcut"
sudo touch /usr/share/applications/firefox-latest.desktop
sudo bash -c "cat > /usr/share/applications/firefox-latest.desktop" <<EOL
[Desktop Entry]
Name=Firefox Latest
Comment=Browse the World Wide Web
GenericName=Web Browser
X-GNOME-FullName=Firefox Latest Web Browser
Exec=/usr/lib/firefox-latest/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/usr/lib/firefox-latest/firefox
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
