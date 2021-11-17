#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Copying bash configs...
echo
cp ~/.bashrc ~/.bashrc.backup
cp ./../configs/.bashrc ~/
source ~/.bashrc
echo
echo Done!
