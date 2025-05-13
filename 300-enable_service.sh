#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Enable services  ##################################"
echo "########################################################################"
tput sgr0
echo


sudo systemctl enable avahi-daemon.service

# Enable and start Bluetooth service
sudo systemctl enable bluetooth.service 
sudo systemctl start bluetooth.service 

# Enable PipeWire services
systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber