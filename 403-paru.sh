#!/bin/bash

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

echo
tput setaf 2
echo "########################################################################"
echo "###################  Install paru ######################################"
echo "########################################################################"
tput sgr0
echo


sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si