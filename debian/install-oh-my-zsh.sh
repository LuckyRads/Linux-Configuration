#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo This script will install oh-my-zsh.

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo oh-my-zsh should be installed.
echo Restart the terminal to see the changes.
echo To install themes, refer to "install-oh-my-zsh-customization.sh" script.
