#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Disable IPv6 on all interfaces ################################"
echo "########################################################################"
tput sgr0
echo

connections_list =($(nmcli -f NAME,TYPE connection show | grep wifi | awk '{print $1}'))

for conn in $connections_list; do
    nmcli connection modify $conn ipv6.method "disabled"
done

for conn in $connections_list; do
    nmcli connection down "$conn" && nmcli connection up "$conn"
done