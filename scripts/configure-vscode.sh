#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo There is currently no automatic script to configure VSCode.
echo
echo It is needed to copy REPO/configs/VSCode_settings.json configuration to VSCode settings.json file.
echo
echo Couple of cool VSCode extensions:
echo -- General --
echo Vim
echo Prettier - code formatter
echo One dark pro theme
echo Bracket Pair Colorizer
echo Docker
echo -------------
echo -- Python --
echo Python
echo Pylance
echo Kite
echo ------------
echo -- JavaScript --
echo ESlint
echo ES7 React/Redux
echo Debugger for firefox
echo ----------------
echo 
