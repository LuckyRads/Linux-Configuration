#!/bin/bash

echo This script installs gaming peripheral software:
echo Piper (for gaming mice)
echo LiquidCtl (for NZXT controllers)

sudo apt install piper

sudo apt install python3
sudo apt install python3-pip
pip3 install liquidctl

echo To configure LiquidCtl please see the documentation. /etc/systemd/system/liquidcfg.service contains the boot configuration.
echo Sample file for NZXT LEDs:
echo [Unit]
echo Description=NZXT startup service
echo 
echo [Service]
echo Type=oneshot
echo ExecStart=liquidctl set led1 color fixed bb00ff
echo 
echo [Install]
echo WantedBy=default.target
