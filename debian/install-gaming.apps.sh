#!/bin/bash

echo This script will install: Piper (mouse software)
echo This script will install: Python3 and pip3 (dependencies for LiquidCtl)
echo This script will install: LiquidCtl (NZXT controller)

sudo apt install piper

sudo apt install python3
sudo apt install python3-pip
pip3 install liquidctl

echo To configure LiquidCtl, please see the documentation.
echo Boot configuration file for LiquidCtl: /etc/systemd/system/liquidcfg.service

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

