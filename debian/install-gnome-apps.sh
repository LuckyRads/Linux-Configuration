#!/bin/bash

echo This script will install: gnome tweak tools
echo This script will install: dconf editor
echo This script will install: Roboto fonts
echo This script will install: Roboto fontsPowerline fonts

sudo apt install gnome-tweak-tool
sudo apt install dconf-editor
sudo apt install fonts-roboto
sudo apt install fonts-powerline

echo The next part of this script is experimental.
echo It will try to install various gnome shell extensions, etc.
echo You can configure all of the following extensions manually.
echo
echo Installing gnome shell extension installer
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
sudo chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

echo Installing ArcMenu:
gnome-shell-extension-installer 3628

echo Installing transparent top bar
gnome-shell-extension-installer 1708

echo Installing gTile
gnome-shell-extension-installer 28

echo Installing multi monitor add-on
gnome-shell-extension-installer 921

echo Installing sound input and output device chooser
gnome-shell-extension-installer 906

