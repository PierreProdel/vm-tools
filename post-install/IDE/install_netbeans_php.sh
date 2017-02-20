#!/bin/bash

echo Installing NetBeans PHP

sudo echo "> Test droit sudo [OK]"

# Download and install
wget http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-php-linux-x64.sh -O netbeans_php.sh
bash netbeans_php.sh
rm -f netbeans_php.sh

# All done
echo ---------------------------------------------------------------------------
echo NetBeans PHP installed
echo ---------------------------------------------------------------------------
