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
echo Paste Terminator configuration file terminator_config to/as ~/.config/terminator/config
echo Install fonts-powerline
echo Paste from functions comment to EOF to the end of your .bashrc https://raw.githubusercontent.com/ChrisTitusTech/scripts/master/fancy-bash-promt.sh

sudo apt update

sudo apt install gnome-tweak-tool
sudo apt install hardinfo
sudo apt install dconf-editor
sudo apt install terminator
