#!/bin/bash

if [[ $(id -u) == 0 ]]; then
    echo Please run this script as non-root.
    exit
fi

echo Copying vim configs...
echo
cp ./../configs/.vimrc ~/
echo
echo Done!
