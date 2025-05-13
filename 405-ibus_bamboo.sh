#!/bin/bash


echo
tput setaf 2
echo "########################################################################"
echo "################### Install Vietnamese keyboard  #######################"
echo "########################################################################"
tput sgr0
echo

packages=(
    ibus-bamboo
)

# Check if the package array is empty
if [ ${#packages[@]} -eq 0 ]; then
  echo "No packages specified in the packages array."
  exit 1
fi

# Variables to store the found AUR helper and its flag
aur_helper=""

# Check for available AUR helpers in order (paru, yay)
for helper in paru yay; do
  if command -v "$helper" >/dev/null 2>&1; then
    aur_helper="$helper"
    break
  fi
done

# Process each package
for pkg in "${packages[@]}"; do
  if pacman -Qi "$pkg" &>/dev/null; then
    echo "✔ $pkg is already installed."
  else
    if [ -n "$aur_helper" ]; then
      echo "➤ Installing $pkg..."
      $aur_helper -S  "$pkg" --noconfirm
    else
      echo "No AUR helper found, skipping..."
      echo "$pkg" >> aur_to_install_later.txt
    fi
  fi
done