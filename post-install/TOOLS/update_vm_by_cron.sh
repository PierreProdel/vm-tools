#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Log cron error and exec
CURRENT_DATE=`date '+%F-%H'`
LOG_DIR=/var/log/vmupdates
sudo mkdir -p ${LOG_DIR}
CRON_LOG=${LOG_DIR}/${CURRENT_DATE}_cron_result.log
sudo touch ${CRON_LOG}

UPDATE_DIR=~/vm-tools/post-install/TOOLS/updateScripts

mkdir -p ${UPDATE_DIR}
cp -f package_update_scripts/*.sh ${UPDATE_DIR}
sudo chmod +x -R ${UPDATE_DIR}

echo "--- ADDING NEW CRON JOBS TO ROOT CRONTAB ---" |sudo tee -a ${CRON_LOG} > /dev/null

CRON_PERIOD1="@reboot"
CRON_PERIOD2="0 12 * * *"
CRON_PERIOD3="0 19 * * *"

# Add jobs to update apt packages (every day at 12:00, 19:00, and on boot)
SCRIPT_UPDATE_APT="update_apt_packages.sh"
JOB1="$CRON_PERIOD1 $UPDATE_DIR/$SCRIPT_UPDATE_APT"
JOB2="$CRON_PERIOD2 $UPDATE_DIR/$SCRIPT_UPDATE_APT"
JOB3="$CRON_PERIOD3 $UPDATE_DIR/$SCRIPT_UPDATE_APT"

FINDJOB1=$(sudo crontab -l | grep -F "$SCRIPT_UPDATE_APT")
if [ -z "$FINDJOB1" ]
then
  echo "ADD APT UPDATE JOB" |sudo tee -a ${CRON_LOG} > /dev/null

  (sudo crontab -l; echo "$JOB1") | sudo crontab -
  (sudo crontab -l; echo "$JOB2") | sudo crontab -
  (sudo crontab -l; echo "$JOB3") | sudo crontab -
else
  echo "APT UPDATE JOB ALREADY EXISTS" | sudo tee -a ${CRON_LOG} > /dev/null
fi

# Add jobs to update clamav virus definition db (every day at 12:00, 19:00, and on boot)
SCRIPT_UPDATE_CLAMAV="update_clamav_virus_def.sh"
JOB4="$CRON_PERIOD1 $UPDATE_DIR/$SCRIPT_UPDATE_CLAMAV"
JOB5="$CRON_PERIOD2 $UPDATE_DIR/$SCRIPT_UPDATE_CLAMAV"
JOB6="$CRON_PERIOD3 $UPDATE_DIR/$SCRIPT_UPDATE_CLAMAV"

FINDJOB2=$(sudo crontab -l | grep -F "$SCRIPT_UPDATE_CLAMAV")
if [ -z "$FINDJOB2" ]
then
  echo "ADD CLAMAV UPDATE JOB" | sudo tee -a ${CRON_LOG} > /dev/null

  (sudo crontab -l; echo "$JOB4") | sudo crontab -
  (sudo crontab -l; echo "$JOB5") | sudo crontab -
  (sudo crontab -l; echo "$JOB6") | sudo crontab -
else
  echo "CLAMAV UPDATE JOB ALREADY EXISTS" | sudo tee -a ${CRON_LOG} > /dev/null
fi

sudo echo " " |sudo tee -a ${CRON_LOG} > /dev/null
sudo echo "sudo crontab -l" | sudo tee -a ${CRON_LOG} > /dev/null

sudo crontab -l |sudo tee -a ${CRON_LOG} > /dev/null