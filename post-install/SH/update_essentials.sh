#!/bin/bash

function install_tool {
  command -v $1 >/dev/null 2>&1 || {
    echo "Installing $1";
    sudo apt-get -y install $1
  }
}

install_tool htop
install_tool jq
