#!/bin/bash

echo Instructions to configure GUI:
echo Install Gnome extensions plugin for Firefox
echo Install Arcmenu extension
echo Install Transparent top bar extension
echo Install Multi monitors add-on extension
echo Install Sound input \& output device chooser extension
echo Configure Ubuntu dock with dconf editor
echo Configure Arcmenu extension with gnome-tweak-tools

echo gTile Gnome extension for window management
echo gTile add 2x2 grid to the end of the line
echo gTile transfer 4x4 grid to the front of the line
echo gTile set window margin to 5

echo
echo Font settings
echo Interface Text: Roboto Regular
echo Legacy Window Titles: Roboto Bold
echo
echo Themes
echo Applications: Mojave-dark
echo Cursor: Yaru
echo Icons: Papirus-Dark
echo Sound: Yaru
echo
echo Dock icons
echo Firefox
echo Files
echo Ubuntu Software
echo System Monitor
echo Terminal
echo Trash
echo Applications
echo
echo Shortcuts
echo System Monitor (ctrl + shift + esc)
echo Suspend (ctrl + super + alt + s)

# Fonts
echo Installing fonts
sudo apt install fonts-roboto
sudo apt install fonts-powerline

# Themes
echo Installing themes and icon packs
mkdir ~/.themes
cp -r ./.themes/* ~/.themes/
sudo apt install papirus-icon-theme
