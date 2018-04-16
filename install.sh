#!/usr/bin/env bash

# NOTE: if neovim isn't playing nicely run :CheckHealth

# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]
then
    echo "Hello Mac User!"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install wget curl fish nvim nodejs npm tmux python3 ssh-copy-id
    brew install caskroom/cask/iterm2
    brew install caskroom/cask/google-chrome
    brew tap caskroom/cask
    brew cask install lastpass
    brew cask install atom
    brew cask install jetbrains-toolbox
    brew cask install spotify
    brew tap caskroom/fonts
    brew cask install font-fira-code
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

pip install --upgrade pip
pip3 install neovim
pip3 install --user neovim jedi psutil setproctitle # nvim


curl -L https://get.oh-my.fish | fish

. "$DOTFILES_DIR/linking.sh"
