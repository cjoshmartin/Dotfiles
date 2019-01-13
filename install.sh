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
    brew cask install jetbrains-toolbox
    brew cask install spotify
    brew cask install slack
    brew cask install discord
    brew cask install duet
    brew cask install dash
    brew cask install dropbox
    brew cask install disk-inventory-x
    brew cask install resilio sync
    brew cask install box-sync
    brew cask install vlc
    brew cask install transmission
    brew cask install wireshark
    brew cask install angry-ip-scanner
    brew cask install tunnelblick
    brew cask install postman
    brew cask install docker
    brew cask install gitkraken
    brew cask install mactex   

    brew cask install skim
    defaults write -app Skim SKAutoReloadFileUpdate -boolean true 

    #install programming font
    brew tap caskroom/fonts
    brew cask install font-fira-code


    brew search spectacle             # Searches all known Casks for a partial or exact match.
    brew cask info spectacle          # Displays information about the given Cask
    
    brew cask install spectacle
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

curl https://raw.githubusercontent.com/connermcd/gtd/master/gtd > get_shit_done.sh
chmod 777 get_shit_done.sh

. "$DOTFILES_DIR/linking.sh"
. "$DOTFILES_DIR/git_config.sh"
