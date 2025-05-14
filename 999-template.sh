##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

echo
tput setaf 2
echo "########################################################################"
echo "###################  software ################################"
echo "########################################################################"
tput sgr0
echo

########### install AUR packages #################################################################################
packages=(
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

############# install pacman packages #################################################################################
packages=(
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