#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "################### Apply nvim config ##################################"
echo "########################################################################"
tput sgr0
echo

sudo pacman -S --needed neovim

echo "removing old nvim config"
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

echo "Installing nvchad config"
#git clone https://github.com/NvChad/starter ~/.config/nvim


if [ -d "~/.config/nvim" ]; then
    mkdir -p ~/backup
    cp -r ~/.config/nvim ~/backup/nvim_$(date +%Y%m%d_%H%M%S)
    echo "Backup of nvim config created at ~/backup/nvim_$(date +%Y%m%d_%H%M%S)"
else
    cp -r ./config/nvim ~/.config/nvim
    echo "Copied nvim config to ~/.config/nvim"
fi
