#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Copying ranger file manager configs...
echo
mkdir ~/.config/ranger
cp ./../configs/rc.conf ~/.config/ranger/
echo
echo Done!
