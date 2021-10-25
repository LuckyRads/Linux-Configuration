#!/bin/bash

echo Installation content:
echo Gnome tweak tools
echo Hardware information
echo Dconf editor
echo Configure GRUB dual boot
echo /etc/default/grub
echo GRUB_DEFAULT=saved
echo GRUB_SAVEDEFAULT=true
echo GRUB_TIMEOUT_STYLE=menu
echo GRUB_TIMEOUT=10
echo Legion5 specific: GRUB_CMDLINE_LINUX_DEFAULT="queit splash
 acpi_backlight=intel acpi_osi=linux"
echo Legion5 specific: change to Dedicated graphics in bios in order for the brightness control to work
echo Terminator terminal
echo New profile
echo Colors: use colors from system theme
echo Transparent background set to 0.90
echo Layout set terminal to created custom profile
echo Add keybindings to switch to tabs (alt + numbers)
echo Copy from functions comment to the EOF https://raw.githubusercontent.com/ChrisTitusTech/scripts/master/fancy-bash-promt.sh and paste it in .bashrc file


sudo apt update

sudo apt install gnome-tweak-tool
sudo apt install hardinfo
sudo apt install dconf-editor
sudo apt install terminator
