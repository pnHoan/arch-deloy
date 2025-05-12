#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  software ################################"
echo "########################################################################"
tput sgr0
echo

sh 100-Preconfig.sh
sh 201-install_packages.sh
sh 202-install_recommended.sh


sh 300-enable_service.sh
sh 400-kde.sh

