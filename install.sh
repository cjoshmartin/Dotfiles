#!/usr/bin/env bash

# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]
then
    echo "Hello Mac User!"
elif [ "$(uname)" == "Linux" ]
then
    apt-get update
    apt-get install -y curl git zsh git-core tmux vim-gtk

    sudo apt-get install -y nodejs npm
    ln -s /usr/bin/nodejs /usr/bin/node
fi


# getting started with symlinks : https://github.com/webpro/dotfiles/blob/b04b26b33df7b7331315c70e92b635f42cf01bf2/install.sh#L20

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sfv $DOTFILES_DIR/zshrc ~/.zshrc
ln -sfv $DOTFILES_DIR/tmux ~/.tmux.conf
ln -sfv $DOTFILES_DIR/vimrc ~/.vimrc




