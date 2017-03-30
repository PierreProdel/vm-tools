#!/bin/bash

clear
echo Installing NetBeans PHP

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-php-linux-x64.sh -O netbeans_php.sh
bash netbeans_php.sh
rm -f netbeans_php.sh

# All done
echo ---------------------------------------------------------------------------
echo NetBeans PHP installed
echo ---------------------------------------------------------------------------
