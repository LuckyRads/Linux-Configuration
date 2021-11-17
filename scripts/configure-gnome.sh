#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Configuring dash to dock with gsettings
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode FOCUS_APPLICATION_WINDOWS
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true

echo Copying gTile configs
cp -r ../configs/gnome-extensions/gTile/* ~/.local/share/gnome-shell/extensions/gTile@vibou/*

echo Settings fonts
gsettings set org.gnome.desktop.interface font-name 'Roboto 11'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 13'

echo Copying themes
mkdir ~/.themes
cp -r ./../themes/* ~/.themes/

echo Setting theme
gsettings set org.gnome.desktop.interface gtk-theme 'Mojave-dark'

echo Setting cursor
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

echo Setting icons
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

echo Setting sound
gsettings set org.gnome.desktop.sound theme-name 'Yaru'

echo Set custom keyboard shortcuts manually:
echo Start system monitor (ctrl + shift + esc)
echo Suspend (ctrl + super + alt + s)
echo
echo Dock icon order:
echo Firefox, Files, Ubuntu Software, System Monitor, Terminal, Trash, Application

