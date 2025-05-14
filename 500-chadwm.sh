#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Erik Dubois
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


packages=(
	dash
    imlib2
    xorg-xsetroot
    acpi
    rofi
    feh
    picm
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
    cp -r ./etc/skel/.config/arco-chadwm "$HOME/.config/"
    cd  "$HOME/.config/arco-chadwm/chadwm" 
    make clean install
fi

echo "ChadWM is installed"