#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Erik Dubois
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

echo
tput setaf 2
echo "########################################################################"
echo "###################  Install Chadwm  ###################################"
echo "########################################################################"
tput sgr0
echo

packages=(
	dash
    imlib2
    xorg-xsetroot
    acpi
    rofi
    feh
    picom
)

# Install packages
for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo "✔ $pkg is already installed."
    else
        echo "➤ Installing $pkg..."
        sudo pacman -S --noconfirm --needed "$pkg"
    fi
done

if [ ! -d "$HOME/.config/arco-chadwm" ]; then
    cp -r ./config/arco-chadwm "$HOME/.config/"
    cd  "$HOME/.config/arco-chadwm/chadwm" 
    sudo make clean install
fi

echo "ChadWM is installed"