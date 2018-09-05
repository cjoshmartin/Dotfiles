#!/usr/bin/env bash

#Changing Dir
alias doc="cd ~/Documents/"
alias down="cd ~/Downloads/"
alias website="cd /Users/Josh/Documents/cjoshmartin.github.io"

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
alias als="bat ~/.terminal_aliases"

curl -s https://api.github.com/octocat #pretty octocat with a quote
echo "To See aliases: 'als'"
