#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo Please run this script as root.
    exit
fi

echo Copying LiquidCtl configs...
echo
sudo cp ./../configs/liquidcfg.service /etc/systemd/system/
echo
echo Done!
