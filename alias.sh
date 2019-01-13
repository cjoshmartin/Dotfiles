#!/usr/bin/env bash

# Notes {
# *setfile (MAC) - allows you to change creation/modication dates of files 
# *xargs (MAC) - allows you to pipe the output of one program as input to another
# }

function doi2bib
# Takes a DOI from a reference paper and makes a bib file
# use `pdfinfo` or crossrefernce.org to find the DOI
#https://www.youtube.com/watch?v=nO4T8JDNYG0
    echo >> bib.bib;
    curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" >> bib.bib;
    echo >> bib.bib;
end


#Changing Dir {
alias down="cd ~/Downloads/"
alias senior="cd ~/Desktop/school/Senior"
alias projects="cd ~/Desktop/projects"
#}

alias pomodoro="~/poamodoro.sh"
alias tesla="ssh chajmart@tesla.cs.iupui.edu" #ssh
alias callhome="ssh joshmartin@50.90.106.69"
alias ip="ipconfig getifaddr en0" #getting ip

alias fucking="sudo" # pass aggressive way to deal with being upset

alias path="echo $PWD" # Show path
alias cpath="path | pbcopy" #copies path to clipboard
alias cleards="find . -type f -name '*.DS_Store' -ls -delete" #removing clear DS_store

alias speechserver="browser-sync start --server --files \"*.html, *.css, *.md\" " #when I  write speeches

alias builda="source ~/.terminal_aliases" # build Aliases

alias als="bat ~/.terminal_aliases" # list aliases

alias skim="open -a Skim.app" #(MAC) : open pdfs

curl -s https://api.github.com/octocat #pretty octocat with a quote
echo "To See aliases: 'als'"
