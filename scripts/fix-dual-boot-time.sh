#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo This script fixes the issue when Windows 10 and Linux dual boot cause OS's times to be out of sync (UTC vs local time zone).
echo
timedatectl set-local-rtc 1
