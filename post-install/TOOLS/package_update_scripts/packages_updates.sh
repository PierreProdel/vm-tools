#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

CURRENT_DATE=`date '+%F-%H-%M'`
LOG_UPDATE_VM=/var/log/${CURRENT_DATE}_vmUpdate.log

sudo touch ${LOG_UPDATE_VM}
sudo bash -c "apt-get update &>> ${LOG_UPDATE_VM}"
sudo bash -c "apt-get -y upgrade &>> ${LOG_UPDATE_VM}"


