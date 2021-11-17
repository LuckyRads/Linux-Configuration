#!/bin/bash

echo This script will install: VS Code
echo This script will install: Postman
echo This script will install: JRE
echo This script will install: Eclipse
echo This script will install: Tor
echo This script will install: Cascadia fonts for VSCode

sudo snap install --classic code
sudo apt install vim
sudo snap install postman
sudo apt install default-jre
sudo snap install --classic eclipse
sudo apt install tor
sudo apt install torbrowser-launcher
sudo apt install fonts-cascadia-code

