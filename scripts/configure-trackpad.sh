#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Copying fusuma configs...
echo
mkdir -p ~/.config/fusuma
cp ./../configs/fusuma.yml ~/.config/fusuma/config.yml
echo
echo Done!
echo To run fusuma as a daemon process (autostart):
echo Run gnome-session-properties
echo Add fusuma path with -d option
