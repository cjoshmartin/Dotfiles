#!/usr/bin/env bash
cli_programs=( "software-properties-common" "python-dev" "python-pip" "python3-dev" "python3-pip" "fish" "neovim" "curl" "git" "zsh" "tmux" "nvim" "nodejs" "npm" "pandoc" "openssh-server" )
user_programs=( "spotify" "chromium" "code" "gitkraken" "go" "slack" "vlc" "docker" "postman" "discord" )

#Fish repos
sudo add-apt-repository -y  ppa:neovim-ppa/stable
sudo apt-add-repository -y  ppa:fish-shell/release-2

sudo apt update

for cli in "${cli_programs[@]}"; do
    sudo apt install -y $cli
done


# User Programs

for user in "${user_programs[@]}"; do
    sudo snap install $user
done

ln -s /usr/bin/nodejs /usr/bin/node
curl -L https://get.oh-my.fish | fish

