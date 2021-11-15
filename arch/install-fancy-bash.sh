#!/bin/bash

cp ~/.bashrc ~/.bashrc.backup
cp ../.bashrc ~
source ~/.bashrc
sudo pacman -S terminator
