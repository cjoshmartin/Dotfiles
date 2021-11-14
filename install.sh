#!/usr/bin/env bash

# NOTE: if neovim isn't playing nicely run :CheckHealth, python might not be install correctly

# get the current location of the director
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]
then
    . "$DOTFILES_DIR/mac/init.sh"

elif [ "$(uname)" == "Linux" ]
then
    . "$DOTFILES_DIR/linux/init.sh"
fi
sudo pip3 install --upgrade pip
pip3 install --user neovim jedi psutil setproctitle # nvim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

. "$DOTFILES_DIR/linking.sh"
. "$DOTFILES_DIR/git_config.sh"
