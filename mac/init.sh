#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Hello Mac User!"

if ! [ -x "$(command -v brew)" ]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew (brew update)"
brew update

# Install a program that allows you to install mac apps
# 1. mas search [app name]
# 2. mas install [app number in the app store]
brew install mas 

# upgrade mac programs using `brew cu`
brew tap buo/cask-upgrade


echo "Installing programs..."

brew bundle --file="$DOTFILES_DIR/Brewfile"

defaults write -app Skim SKAutoReloadFileUpdate -boolean true 

echo "Done with Mac script"
