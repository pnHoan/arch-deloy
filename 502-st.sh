#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Erik Dubois
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 2
echo "########################################################################"
echo "###################  Install st  #######################################"
echo "########################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed gd

if [-d "$HOME/.config/suckless/st"]; then
   mv "$HOME/.config/suckless/st" "$HOME/.config/suckless/st.old"
   echo "Backup of st config created" 
fi

cp -r ./suckless "$HOME/.config/" 
cd  "$HOME/.config/suckless/st" 
sudo make clean install

if command -v st >/dev/null 2>&1; then
    echo "st is installed!"
else
    echo "st is not installed."
    exit 1
fi