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
user_program_install(){
    brew cask install $1
}

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ "$(uname)" == "Darwin" ]
then
    echo "Hello Mac User!"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    user_program_install lastpass
    user_program_install atom
    user_program_install jetbrains-toolbox
    user_program_install spotify
    user_program_install slack
    user_program_install discord
    user_program_install duet
    user_program_install dash
    user_program_install dropbox
    user_program_install disk-inventory-x
    user_program_install resilio-sync
    user_program_install box-drive
    user_program_install vlc
    user_program_install transmission
    user_program_install wireshark
    user_program_install angry-ip-scanner
    user_program_install tunnelblick
    user_program_install postman
    user_program_install docker
    user_program_install gitkraken
    user_program_install mactex   

    user_program_install skim
    defaults write -app Skim SKAutoReloadFileUpdate -boolean true 

    #install programming font
    brew tap caskroom/fonts
    user_program_install font-fira-code


    brew search spectacle             # Searches all known Casks for a partial or exact match.
    brew cask info spectacle          # Displays information about the given Cask
    
    user_program_install spectacle
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
