#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Disable IPv6 on all interfaces ################################"
echo "########################################################################"
tput sgr0
echo

# Get WiFi connection names, filter non-empty lines, and ensure only valid names
connections_list=$(nmcli -f NAME,TYPE connection show | grep wifi | awk '$1 != "" {print $1}' | grep -v '^$')

echo "$connections_list"
if [ -z "$connections_list" ]; then
    echo "No WiFi connections found."
else
    for conn in $connections_list; do
        nmcli connection modify "$conn" ipv6.method "disabled"
    done

    for conn in $connections_list; do
        nmcli connection down "$conn" && nmcli connection up "$conn"
    done
fi
read -n 1 -s -r -p "Please check output before continue. Press any key to continue..."