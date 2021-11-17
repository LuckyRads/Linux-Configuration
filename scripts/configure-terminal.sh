#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Copying terminator configs...
echo
mkdir ~/.config/terminator/
cp ./../configs/terminator_config ~/.config/terminator/config
echo
echo Done!
