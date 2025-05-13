#!/bin/bash


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