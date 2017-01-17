#!/bin/bash

echo Installing Cloud Foundry

sudo echo "> Test droit sudo [OK]"

wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
sudo apt-get update
sudo apt-get install cf-cli

echo Installing IBM Bluemix Container Service Plug-in
cf install-plugin https://static-ice.ng.bluemix.net/ibm-containers-linux_x64 -f

cf plugins
