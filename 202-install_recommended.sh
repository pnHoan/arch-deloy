#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Install recommended packages ######################"
echo "########################################################################"
tput sgr0
echo

packages=(
duf
findutils
git
glances
hwinfo
inxi
meld
nano-syntax-highlighting
pv
python-defusedxml
python-packaging
rsync
tldr
sed
vi
wget
firefox
firewalld
python-pyqt6
aspell
tmux
zsh
ttf-iosevkaterm-nerd
reflector
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