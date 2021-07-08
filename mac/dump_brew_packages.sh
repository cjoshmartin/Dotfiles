#!/usr/bin/env bash


DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
# Really good articale on everything brew

brew bundle dump --force --file="$DOTFILES_DIR/Brewfile"

