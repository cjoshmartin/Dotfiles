#!/usr/bin/env bash

# NOTE: if neovim isn't playing nicely run :CheckHealth, python might not be install correctly

# get the current location of the director

gitInstaller () {
    # NOTE: package should be in the format of `gituser/repo`
    local package="$1"
    local url=`https://api.github.com/repos/${package}/releases/latest`
    local downloadType=""

    if [ "$(uname)" == "Darwin" ]
    then
        $downloadType="browser_download_url.*dmg"
    elif [ "$(uname)" == "Linux" ]
    then
        $downloadType="browser_download_url.*deb"
    fi

    curl -s $url \
        | grep $downloadType \
        | cut -d : -f 2,3 \
        | tr -d \" \
        | wget -qi -

    echo "Download Complete"
}

brew_ins(){
    brew install $1
}

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]
then
    echo "Hello Mac User!"
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    # Systems programs
    brew_ins wget
    brew_ins curl
    brew_ins fish
    brew_ins nvim
    brew_ins nodejs 
    brew_ins npm 
    brew_ins tmux
    brew_ins python3
    brew_ins ssh-copy-id
    brew_ins pandoc
    brew_ins bat
    brew install caskroom/cask/iterm2
    brew install caskroom/cask/google-chrome
    brew tap caskroom/cask
    # User Programs
    brew cask install lastpass
    brew cask install atom
    brew cask install brains-toolbox
    brew cask install spotify
    brew cask install duet
    brew cask install disk-inventory-x
    install programming font
    brew tap caskroom/fonts
    brew cask install font-fira-code
    #echo "Oh-myFish need to be install manually. For Mac"
    # install vim plug for mac

elif [ "$(uname)" == "Linux" ]
then
    sudo apt-get install -y software-properties-common
    sudo apt-get install -y python-dev python-pip python3-dev python3-pip
    sudo add-apt-repository -y  ppa:neovim-ppa/stable
    sudo apt-add-repository -y  ppa:fish-shell/release-2
    sudo apt update
    sudo apt install -y\
        fish\
        neovim\
        curl\
        git\
        zsh\
        git-core\
        tmux\
        vim-gtk\
        nvim\
        nodejs\ 
        npm
    ln -s /usr/bin/nodejs /usr/bin/node
    curl -L https://get.oh-my.fish | fish

    gitInstaller "sharkdp/bat" #not tested
    echo "need to install sharkdp/bat manual"

fi

. "$DOTFILES_DIR/neovim_python_fix.sh"
sudo pip install --upgrade pip
pip install --user neovim jedi psutil setproctitle # nvim



. "$DOTFILES_DIR/linking.sh"
. "$DOTFILES_DIR/git_config.sh"
