#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo This script will install powerlevel10k theme and zsh autocompletion plugin.

# powerlevel10k theme installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# autocompletion plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo powerline10k theme should be installed.
echo Restart the terminal to see the changes.
echo In order to use the powerline10k theme:
echo In ~/.zshrc set:
echo ZSH_THEME="powerlevel10k/powerlevel10k"
echo In order to use the autocompletion, add "zsh-autosuggestions" entry to zsh plugins variable.
