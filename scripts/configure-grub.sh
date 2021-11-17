#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as root.
    exit
fi

echo This script will not install or configure anything.
echo It contains guidelines of how to configure GRUB.
echo
echo === GRUB for Linux and Windows dual boot ===
echo /etc/default/grub
echo GRUB_DEFAULT=saved
echo GRUB_SAVEDEFAULT=true
echo GRUB_TIMEOUT_STYLE=menu
echo GRUB_TIMEOUT=10
echo ============================================
echo
echo === Lenovo Legion 5 specific GRUB config ===
echo GRUB_CMDLINE_LINUX_DEFAULT="queit splash acpi_backlight=intel acpi_osi=linux"
echo ============================================
echo Note: on Legion 5, in order for ACPI backlighting control to work,
echo it is necessary to switch to Dedicated graphics in the bios.
echo
echo No files were copied but a grub config is provided in the REPO/configs/grub file.
echo After each grub file change, run sudo update-grub
echo
echo Done!
