#!/bin/bash

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

echo
tput setaf 2
echo "########################################################################"
echo "###################  software ################################"
echo "########################################################################"
tput sgr0
echo

if [ -f aur_to_install_later.txt ]; then
    echo "The following AUR packages were not installed:"
    cat aur_to_install_later.txt
    echo "Please install them manually."
else
    echo "No AUR packages to install later."
fi