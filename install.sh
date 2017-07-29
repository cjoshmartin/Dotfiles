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
    echo " \n \n \n  Oh-my-zsh in needs to be install manually \n\n " 


fi


# getting started with symlinks : https://github.com/webpro/dotfiles/blob/b04b26b33df7b7331315c70e92b635f42cf01bf2/install.sh#L20

ln -sfv "$DOTFILES_DIR/.zshrc" ~
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~





