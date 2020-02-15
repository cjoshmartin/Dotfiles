#!/usr/bin/env bash

cli_programs=("wget" "curl" "fish" "nvim" "nodejs " "npm " "tmux" "python3" "ssh-copy-id" "pandoc" "bat" "yarn")
user_programs=( "lastpass"  "jetbrains-toolbox" "spotify" "slack" "discord" "duet" "dash" "dropbox" "disk-inventory-x" "resilio-sync" "box-drive" "vlc" "transmission" "wireshark" "angry-ip-scanner" "tunnelblick" "postman" "docker" "gitkraken" "mactex" "skim")

user_program_install(){
    brew cask install $1
}

echo "Hello Mac User!"

if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
# Systems programs

for cli in "${cli_programs[@]}"; do
    brew install cli
done
brew install caskroom/cask/iterm2
brew install caskroom/cask/google-chrome
brew tap caskroom/cask

# User Programs

for user in "${user_programs[@]}"; do
    brew cask install user
done

defaults write -app Skim SKAutoReloadFileUpdate -boolean true 

    #install programming font
    brew tap caskroom/fonts
    brew cask install font-fira-code


    brew search spectacle             # Searches all known Casks for a partial or exact match.
    brew cask info spectacle          # Displays information about the given Cask

    brew cask install spectacle
