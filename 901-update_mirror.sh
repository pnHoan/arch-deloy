#!/bin/bash

echo
tput setaf 2
echo "########################################################################"
echo "###################  Update mirror                  ####################"
echo "########################################################################"
tput sgr0
echo

pkg="reflector"

if pacman -Qi "$pkg" &>/dev/null; then
    sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
  else
    sudo pacman -S --noconfirm --needed "$pkg"
    sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
  fi
