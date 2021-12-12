#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo Please run this script as root.
    exit
fi

echo This script will install the ZSH bash and all the required prerequisites.

sudo apt update
sudo apt install build-essential curl file git
sudo apt install zsh
sudo apt install git-core curl fonts-powerline

echo Please run zsh --version in order to see if zsh was installed correctly.
