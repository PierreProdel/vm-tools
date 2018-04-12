#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# log dir
LOG_DIR=/var/log/vmupdates
sudo mkdir -p ${LOG_DIR}

# log file
CURRENT_DATE=`date '+%F-%H'`
LOG_ANTIVIR_VM=${LOG_DIR}/${CURRENT_DATE}_antivir_install.log
sudo touch ${LOG_ANTIVIR_VM}

echo "--- INSTALLING CLAMAV ANTIVIRUS ---" |sudo tee -a ${LOG_ANTIVIR_VM} > /dev/null

# apt update
sudo bash -c "apt-get update &>> ${LOG_ANTIVIR_VM}"
# antivirus install
sudo bash -c "apt-get install -y clamav &>> ${LOG_ANTIVIR_VM}"
# interface graphique install
sudo bash -c "apt-get install -y clamtk &>> ${LOG_ANTIVIR_VM}"