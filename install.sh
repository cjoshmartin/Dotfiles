#!/usr/bin/env bash

# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# getting started with symlinks : https://github.com/webpro/dotfiles/blob/b04b26b33df7b7331315c70e92b635f42cf01bf2/install.sh#L20

ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~

#install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Linking vim
ln -sfv "$DOTFILES_DIR/.vimrc" ~




#if [ "$(uname)" == "Darwin" ]; then
 # install vim plug for mac

# fi
