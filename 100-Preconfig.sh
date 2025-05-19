#!/bin/bash

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

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

# Disable IPv6 on all interfaces
sh 900-disable_ipv6.sh
sh 901-update_mirror.sh

# Make a backup folder
mkdir -p ~/backup

# Copy the personal config files to the home directory
path=$(pwd)
cp -r $path/personal/. "$HOME/"

# Create the .Xresources file
cat << EOF > "$HOME/.Xresources"
! SOURCE PROGRAM SPECIFIC FILES !
#include "$HOME/.xres/st"


! SOURCE TERMINAL COLORS !
!#include "$HOME/.xres/themes/Tokyodark"
!#include "$HOME/.xres/themes/Dracula"
#include "$HOME/.xres/themes/Hyper"
EOF