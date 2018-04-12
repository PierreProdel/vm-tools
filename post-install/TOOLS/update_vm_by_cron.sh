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

# Add job to update apt packages (every first day of the month at 21:00)
CRON_PERIOD1="0 21 1 * *"
JOB1="$CRON_PERIOD1 $UPDATE_DIR/update_apt_packages.sh"
FINDJOB1=$(sudo crontab -l | grep -F "$JOB1")

if [ -z "$FINDJOB1" ]
then
  echo "ADD APT UPDATE JOB" |sudo tee -a ${CRON_LOG} > /dev/null

  (sudo crontab -l; echo "$JOB1") | sudo crontab -
else
  echo "APT UPDATE JOB ALREADY EXISTS" | sudo tee -a ${CRON_LOG} > /dev/null
fi

# Add job to update clamav virus definition db (every monday at 21:00)
CRON_PERIOD2="0 21 * * 1"
JOB2="$CRON_PERIOD2 $UPDATE_DIR/update_clamav_virus_def.sh"
FINDJOB2=$(sudo crontab -l | grep -F "$JOB2")

if [ -z "$FINDJOB2" ]
then
  echo "ADD CLAMAV UPDATE JOB" | sudo tee -a ${CRON_LOG} > /dev/null
  (sudo crontab -l; echo "$JOB2") | sudo crontab -
else
  echo "CLAMAV UPDATE JOB" | sudo tee -a ${CRON_LOG} > /dev/null
fi

# Add job to update clamav virus definition db (on reboot)
CRON_PERIOD3="@reboot"
JOB3="$CRON_PERIOD3 $UPDATE_DIR/update_clamav_virus_def.sh"
FINDJOB3=$(sudo crontab -l | grep -F "$JOB3")

if [ -z "$FINDJOB2" ]
then
  echo "ADD CLAMAV UPDATE JOB" | sudo tee -a ${CRON_LOG} > /dev/null
  (sudo crontab -l; echo "$JOB3") | sudo crontab -
else
  echo "CLAMAV UPDATE JOB" | sudo tee -a ${CRON_LOG} > /dev/null
fi

sudo echo " " |sudo tee -a ${CRON_LOG} > /dev/null
sudo echo "sudo crontab -l" | sudo tee -a ${CRON_LOG} > /dev/null

sudo crontab -l |sudo tee -a ${CRON_LOG} > /dev/null