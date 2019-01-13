#!/usr/bin/env bash

#Changing Dir
alias doc="cd ~/Documents/"
alias down="cd ~/Downloads/"
alias website="cd /Users/Josh/Documents/cjoshmartin.github.io"

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

#ssh
alias tesla="ssh chajmart@tesla.cs.iupui.edu"
#getting ip
alias ip="ipconfig getifaddr en0"

# pass aggressive way to deal with being upset
alias fucking="sudo"

alias path="echo $PWD"
alias cpath="path | pbcopy" #copies path to clipboard
#removing clear DS_store
alias cleards="find . -type f -name '*.DS_Store' -ls -delete"

#when I  write speeches
alias speechserver="browser-sync start --server --files \"*.html, *.css, *.md\" "

# Unit Testing
alias download_catch="wget https://github.com/catchorg/Catch2/releases/download/v2.1.2/catch.hpp"

# build Aliases
alias builda="source ~/.terminal_aliases"

# list aliases
if hash bat 2>/dev/null/; then
    alias als="bat ~/.terminal_aliases"
else
    alias als="cat ~/.terminal_aliases"
fi

curl -s https://api.github.com/octocat #pretty octocat with a quote
echo "To See aliases: 'als'"
