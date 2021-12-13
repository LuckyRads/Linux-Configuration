#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo This script will install oh-my-zsh and powerlevel10k theme.

# oh-my-zsh installation
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerlevel10k theme installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# autocompletion plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo oh-my-zsh and powerline10k theme should be installed.
echo Restart the terminal to see the changes.
echo In order to use the powerline10k theme:
echo In ~/.zshrc set:
echo ZSH_THEME="powerlevel10k/powerlevel10k"
