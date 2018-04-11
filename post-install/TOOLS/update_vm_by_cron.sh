#!/usr/bin/env bash

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

mkdir -p ~/.bashrc.d
cp -f bashrc.d/*.bashrc ~/.bashrc.d/

sudo crontab -l | { cat; echo "0 0 1 * * /home/vm"; } | crontab -