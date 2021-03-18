#!/bin/bash

echo Install Gnome extensions plugin for Firefox
echo Install Arcmenu extension
echo Install Transparent top bar extension
echo Install Multi monitors add-on extension
echo Install Sound input \& output device chooser extension
echo Configure Ubuntu dock with dconf editor
echo Configure Arcmenu extension with gnome-tweak-tools
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

# Fonts
echo Installing fonts
mkdir ~/.fonts
cp -r ./.fonts/* ~/.fonts/

# Themes
echo Installing themes and icon packs
mkdir ~/.themes
cp -r ./.themes/* ~/.themes/
sudo apt install papirus-icon-theme
