#!/bin/bash

# TODO: Automate run the scripts in order with out modyfying this scripts. Maybe this script should be use to disable the scripts that are not needed for the user.
echo
tput setaf 2
echo "########################################################################"
echo "###################  Start install HwanOS ##############################"
echo "########################################################################"
tput sgr0
echo

sh 100-Preconfig.sh
sh 201-install_packages.sh
sh 202-install_recommended.sh
sh 300-enable_service.sh
sh 400-kde.sh
sh 401-zsh.sh
sh 402-tmux.sh
sh 403-paru.sh
sh 404-nvim.sh
#sh 405-ibus_bamboo.sh
sh 500-chadwm.sh
sh 501-chadwm_post_config.sh
sh 502-st.sh
sh 600-clean_up.sh



