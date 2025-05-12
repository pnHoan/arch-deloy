#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  software ################################"
echo "########################################################################"
tput sgr0
echo

# Network manager issue
nmcli connection modify Wired\ connection\ 1 ipv6.method "disabled"

sh 900-ipv6.sh

cp -r ./personal/* ~/