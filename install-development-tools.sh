#!/bin/bash

echo Installation content:
echo Visual Studio Code
echo Vim
echo Postman
echo JRE
echo Eclipse
echo Tor
echo GitAhead (could need user intervention)

sudo snap install --classic code
sudo apt install vim
sudo snap install postman
sudo apt install default-jre
sudo snap install --classic eclipse
sudo apt install tor

# GitAhead installation
sudo cp ./GitAhead*.sh /opt
sudo cp ./gitahead.desktop ~/.local/share/applications/gitahead.desktop
sudo cd /opt
sudo chmod +x ./GitAhead*.sh
sudo ./GitAhead*.sh
sudo ln -s /opt/GitAhead/GitAhead /usr/local/bin/GitAhead
sudo chown -R root:root /opt/GitAhead
sudo rm ./GitAhead*.sh
