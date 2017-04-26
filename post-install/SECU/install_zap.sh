#!/bin/bash

clear
echo Installing ZAP

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

sudo echo 'deb http://download.opensuse.org/repositories/home:/cabelo/Debian_8.0/ /' > /etc/apt/sources.list.d/owasp-zap.list 
sudo apt-get update
sudo apt-get install owasp-zap

# All done
# All done
echo ---------------------------------------------------------------------------
echo ZAP installed and integrated in launch menu
echo ---------------------------------------------------------------------------
