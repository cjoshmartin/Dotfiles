#!/usr/bin/env bash

# NOTE: if neovim isn't playing nicely run :CheckHealth

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
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
    apt-get update
    apt-get install -y curl git zsh git-core tmux vim-gtk
    sudo apt-get install -y nodejs npm
    ln -s /usr/bin/nodejs /usr/bin/node
fi



curl -L https://get.oh-my.fish | fish

. "$DOTFILES_DIR/linking.sh"
