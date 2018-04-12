#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# log dir
LOG_DIR=/var/log/vmupdates
sudo mkdir -p ${LOG_DIR}

# log file
CURRENT_DATE=`date '+%F-%H'`
LOG_UPDATE_VM=${LOG_DIR}/${CURRENT_DATE}_vm_update.log
sudo touch ${LOG_UPDATE_VM}

echo "--- UPDATING APT PACKAGES ---" |sudo tee -a ${LOG_UPDATE_VM} > /dev/null

# update + upgrade
sudo bash -c "apt-get update &>> ${LOG_UPDATE_VM}"
sudo bash -c "apt-get -y upgrade &>> ${LOG_UPDATE_VM}"


