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
    brew install wget curl fish nvim nodejs npm tmux python3 ssh-copy-id pandoc
    brew install caskroom/cask/iterm2
    brew install caskroom/cask/google-chrome
    brew tap caskroom/cask
    brew cask install lastpass
    brew cask install atom
    brew cask install jetbrains-toolbox
    brew cask install spotify
    brew tap caskroom/fonts
    brew cask install font-fira-code
    brew cask install duet
    echo "Fish need to be install manually. For Mac"
 # install vim plug for mac

elif [ "$(uname)" == "Linux" ]
then
    sudo apt-get install -y software-properties-common
    sudo apt-get install -y python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository -y  ppa:neovim-ppa/stable
    sudo apt-add-repository -y  ppa:fish-shell/release-2
    sudo apt update
    sudo apt install -y fish neovim
    apt install -y curl git zsh git-core tmux vim-gtk nvim
    sudo apt install -y nodejs npm
    ln -s /usr/bin/nodejs /usr/bin/node
    curl -L https://get.oh-my.fish | fish
fi

. "$DOTFILES_DIR/neovim_python_fix.sh"
sudo pip install --upgrade pip
pip install --user neovim jedi psutil setproctitle # nvim



. "$DOTFILES_DIR/linking.sh"
. "$DOTFILES_DIR/git_config.sh"
