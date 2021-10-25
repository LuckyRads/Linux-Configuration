#!/bin/bash

echo Installation content:
echo Gnome tweak tools
echo Hardware information
echo Dconf editor
echo Configure GRUB dual boot
echo /etc/default/grub
echo GRUB_DEFAULT=saved
echo GRUB_SAVEDEFAULT=true
echo GRUB_TIMEOUT_STYLE=hidden
echo GRUB_TIMEOUT=10
echo Legion5 specific: GRUB_CMDLINE_LINUX_DEFAULT="queit splash
 acpi_backlight=intel acpi_osi=linux"
echo Legion5 specific: change to Dedicated graphics in bios in order for the brightness control to work

sudo apt update

sudo apt install gnome-tweak-tool
sudo apt install hardinfo
sudo apt install dconf-editor

