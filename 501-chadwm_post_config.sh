#!/bin/bash

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

echo
tput setaf 2
echo "########################################################################"
echo "###################  apply chadwm to display manager ###################"
echo "########################################################################"
tput sgr0
echo

sudo cp ./usr/bin/exec-chadwm /usr/bin/exec-chadwm
sudo chmod +x /usr/bin/exec-chadwm
sudo cp  ./usr/share/xsessions/arco-chadwm.desktop /usr/share/xsessions/arco-chadwm.desktop
sudo chmod +x $HOME/.config/arco-chadwm/scripts/run.sh

echo "ChadWM is applied to display manager"