#!/bin/bash

debug=true
if [ "$debug" = true ]; then
    read -n 1 -s -r -p "Press any key to continue..."
fi

echo
tput setaf 2
echo "########################################################################"
echo "###################  Installing zinit and setting up zsh ################"
echo "########################################################################"
tput sgr0
echo

# Backup existing .zshrc if it exists
if [ -f ./personal/.p10k.zsh ]; then
    cp ./personal/.p10k.zsh ~/.p10k.zsh 
    echo "Copied .p10k.zsh to home directory"
fi

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Apply new .zshrc
cat << 'EOF' >> ~/.zshrc

# Load plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z
zinit light zsh-users/zsh-syntax-highlighting

# Load powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Initialize completions
autoload -Uz compinit && compinit

# Source p10k configuration if exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal
EOF


sudo chsh -s $(which zsh) $USER
ehcho "Changed default shell to zsh for user $USER"


echo "Installation complete. Please start a new zsh session to apply the changes."
echo "Run 'p10k configure' to set up your powerlevel10k theme if you haven't already."

