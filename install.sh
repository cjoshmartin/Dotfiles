#!/usr/bin/env bash

# check if a program is installer, if not will install it.
linuxInstaller(){

    command -v $1 >/dev/null 2>&1 || { apt-get install -y $1; } 

}


# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"




if [ "$(uname)" == "Darwin" ]
then
    echo "Hello Mac User!"
    brew install fish
 # install vim plug for mac
elif [ "$(uname)" == "Linux" ]
then
    apt-get update
    linuxInstaller "curl"
    linuxInstaller "git"
    linuxInstaller "zsh"
    LinuxInstaller "git-core"
    linuxInstaller "tmux"
    linuxInstaller "vim-gtk" # vim with +clipboard
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
fi



curl -L https://get.oh-my.fish | fish

. "$DOTFILES_DIR/linking.sh"
