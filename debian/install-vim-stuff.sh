#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo Please run this script as root.
    exit
fi

echo This script will install vim all the required prerequisites.

sudo apt update
sudo apt install vim

echo Installing plug for vim...
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

