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

. "$DOTFILES_DIR/neovim_python_fix.sh"
sudo pip install --upgrade pip
pip install --user neovim jedi psutil setproctitle # nvim

omf install nvm
curl https://raw.githubusercontent.com/connermcd/gtd/master/gtd > get_shit_done.sh
chmod 777 get_shit_done.sh

. "$DOTFILES_DIR/linking.sh"
. "$DOTFILES_DIR/git_config.sh"
