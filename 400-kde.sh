#!/bin/bash

packages=(
ark
bluedevil
breeze-gtk
dolphin
dolphin-plugins
ffmpegthumbs
fwupd
gwenview
haruna
kate
kcalc
kde-cli-tools
kde-gtk-config
kdeconnect
kdegraphics-thumbnailers
kdenetwork-filesharing
kdeplasma-addons
kgamma
kimageformats
kinfocenter
kio-admin
kio-extras
kio-fuse
konsole
kscreen
kwallet-pam
kwayland-integration
libappindicator-gtk3
maliit-keyboard
okular
plasma-browser-integration
plasma-desktop
plasma-disks
plasma-firewall
plasma-nm
plasma-pa
plasma-systemmonitor
plasma-workspace
powerdevil
print-manager
qt6-imageformats
sddm-kcm
spectacle
xdg-desktop-portal-kde
xsettingsd
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