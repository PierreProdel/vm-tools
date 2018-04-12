#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# log dir
LOG_DIR=/var/log/vmupdates
sudo mkdir -p ${LOG_DIR}

# log file
CURRENT_DATE=`date '+%F-%H'`
LOG_ANTIVIR_VM=${LOG_DIR}/${CURRENT_DATE}_antivir_def_update.log
sudo touch ${LOG_ANTIVIR_VM}

echo "--- UPDATING CLAMAV ANTIVIRUS DB ---" |sudo tee -a ${LOG_ANTIVIR_VM} > /dev/null

# stop service
sudo bash -c "service clamav-freshclam stop &>> ${LOG_ANTIVIR_VM}"
# do update
sudo bash -c "freshclam &>> ${LOG_ANTIVIR_VM}"
# start service again
sudo bash -c "service clamav-freshclam start &>> ${LOG_ANTIVIR_VM}"