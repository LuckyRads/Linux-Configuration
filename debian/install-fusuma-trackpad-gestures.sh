#!/bin/bash

echo This script will install: libinput-tools
echo This script will install: Ruby
echo This script will install: fusuma trackpad gestures
echo This script will install: xdotool for sending shortcuts

sudo apt install libinput-tools
sudo apt install ruby
sudo gem install fusuma
sudo apt install xdotool

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

