echo
tput setaf 2
echo "########################################################################"
echo "################### Apply tmux config   ################################"
echo "########################################################################"
tput sgr0
echo

if [ -f ./config/tmux/tmux.conf ]; then
    mkdir -p ~/.config/tmux
    cp ./config/tmux/tmux.conf ~/.config/tmux/tmux.conf
    echo "Copied tmux.conf to ~/.config/tmux"
fi