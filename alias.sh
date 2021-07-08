#!/usr/bin/env bash

# Notes {
# *setfile (MAC) - allows you to change creation/modication dates of files 
# *xargs (MAC) - allows you to pipe the output of one program as input to another
# }


#Changing Dir {
alias down="cd ~/Downloads/"
alias projects="cd ~/Desktop/projects"
#}

alias pomodoro="~/poamodoro.sh"
alias ip="ipconfig getifaddr en0" #getting ip

alias fucking="sudo" # pass aggressive way to deal with being upset

alias path="echo $PWD" # Show path
alias cpath="path | pbcopy" #copies path to clipboard
alias cleards="find . -type f -name '*.DS_Store' -ls -delete" #removing clear DS_store

alias speechserver="browser-sync start --server --files \"*.html, *.css, *.md\" " #when I  write speeches

alias builda="source ~/.terminal_aliases" # build Aliases
alias skim="open -a Skim.app" #(MAC) : open pdfs

# list aliases
#if hash bat 2>/dev/null/; then
    alias als="bat ~/.terminal_aliases"
#else
    #alias als="cat ~/.terminal_aliases"
#fi

curl -s https://api.github.com/octocat #pretty octocat with a quote
echo "To See aliases: 'als'"
