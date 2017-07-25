#!/usr/bin/env bash

linuxInstaller(){

    command -v $1 >/dev/null 2>&1 || { apt-get install -y $1 >&2;} 

}


# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"




if [ "$(uname)" == "Darwin" ]
    echo "Hello Mac User!"
then
 # install vim plug for mac
elif ["$(uname)"=="Linux"]
    apt-get update
    linuxInstaller "curl"
    linuxInstaller "git"
    linuxInstaller "zsh"
fi

# getting started with symlinks : https://github.com/webpro/dotfiles/blob/b04b26b33df7b7331315c70e92b635f42cf01bf2/install.sh#L20

ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~

#check if plug is install if not, installs it
if [! -e ~/.vim/autoload/plug.vim]
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
#Linking vim



