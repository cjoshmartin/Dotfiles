#!/usr/bin/env bash

# getting started with symlinks : https://github.com/webpro/dotfiles/blob/b04b26b33df7b7331315c70e92b635f42cf01bf2/install.sh#L20

# get the current location of the director

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv $DOTFILES_DIR/zshrc.sh ~/.zshrc
ln -sfv $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -sfv $DOTFILES_DIR/vimrc.vim ~/.vimrc
ln -sfv $DOTFILES_DIR/alias.sh ~/.terminal_aliases
ln -sfv $DOTFILES_DIR/gitignoreGlobal.sh ~/.gitignore

echo "source ~/.terminal_aliases" >> ~/.bashrc
echo "source ~/.terminal_aliases" >> ~/.zshrc

ln -sfv $DOTFILES_DIR/ngrok ~/ngrok

mkdir ~/.config
mkdir ~/.config/nvim
ln -sfv $DOTFILES_DIR/neovim.vim ~/.config/nvim/init.vim

mkdir ~/.config/fish/
mkdir ~/.config/fish/functions/
ln -sfv $DOTFILES_DIR/fish_terminal.sh ~/.config/fish/functions/fish_prompt.fish
