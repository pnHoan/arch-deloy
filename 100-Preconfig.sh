#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Preconfig #########################################"
echo "########################################################################"
tput sgr0
echo

# Network manager issue
nmcli connection modify Wired\ connection\ 1 ipv6.method "disabled"
nmcli connection down "Wired connection 1" && nmcli connection up "Wired connection 1"
read -n 1 -s -r -p "Press any key to continue..."

sh 900-disable_ipv6.sh

path=$(pwd)
cp -r $path/personal/. ~/