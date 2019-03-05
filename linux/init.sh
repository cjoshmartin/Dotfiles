#!/usr/bin/env bash
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

