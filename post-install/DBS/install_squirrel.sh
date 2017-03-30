#!/usr/bin/env bash

clear
echo "- Installing SQuirreL SQL Client"
install_folder=/usr/lib

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

command -v java >/dev/null 2>&1 || {
  echo No java installation found, installing jdk8
  bash $(dirname $0)/../JDK/install_jdk8.sh
}

# Fixed version to ensure options file compliance
echo "- Downloading SQuirreL SQL Client 3.7.1"
wget --content-disposition http://sourceforge.net/projects/squirrel-sql/files/1-stable/3.7.1/squirrel-sql-3.7.1-standard.jar/download

jarName=$(ls -t squirrel-sql-*.jar | head -1)
echo "- Installing $jarName"
sudo java -jar $jarName -options-auto $(dirname $0)/install_squirrel.xml

echo "- Creates shortcut"
sudo touch /usr/share/applications/squirrel.desktop
sudo bash -c "cat > /usr/share/applications/squirrel.desktop" <<EOL
[Desktop Entry]
Version=3.7.1
Type=Application
Name=SQuirrel SQL Client
Icon=/usr/local/squirrel-sql-snapshot-20161028_2034/icons/acorn.png
Exec="/usr/local/squirrel-sql-snapshot-20161028_2034/squirrel-sql.sh" %f
Comment=The Drive to Develop
Categories=Development;Database
Terminal=false
EOL

rm $jarName
