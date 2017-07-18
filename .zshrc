# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/josh/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="miloshadzic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(jsontools last-working-dir lol sudo docker yarn vi-mode web-search )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Work Stuff
alias cnbuild="cd /Users/Josh/Documents/Cyberlab/cndoc/docker-dev; docker-compose build"
alias cnrun="cd /Users/Josh/Documents/Cyberlab/cndoc/docker-dev; docker-compose restart"
alias cn="cd /Users/Josh/Documents/Cyberlab"
alias testing="cd  /Users/Josh/Documents/Cyberlab/testing"
#http  stuff
alias host="sudo killall -HUP mDNSResponder;sudo nano /etc/hosts"
ngrok(){
  ~/ngrok $*
}
#Changing Dir
alias doc="cd ~/Documents/"
alias down="cd ~/Downloads/"
alias website="cd /Users/Josh/Documents/cjoshmartin.github.io"
alias c240="cd /Users/Josh/BitTorrent\ Sync/School/Sophomore/Spring\ Semester/CSCI\ 24000\ Computing\ II"
#alias updating
alias newa="vim ~/.zshrc"
alias builda="source ~/.zshrc"
# Important commemt, helps me remeber what is in this file -- Updated often
alias lsa="sed -n 86,133p ~/.zshrc"

vs(){
  
  code $1
}

# Git
ag (){
 #git add
  git add -v $1
}

cg(){
  #git commit
  # git commit -m "TITLE" -m "DESCRIPTION"
 #https://stackoverflow.com/questions/16122234/how-to-commit-a-change-with-both-message-and-description-from-the-command-li
  git commit -m $*
}
pg(){
  #git push
  git push -v $1
}
#money scripts
alias paycheck=" casperjs /Users/Josh/Documents/scrapping-for-a-better-future_project/scrapping_scripts/paycheck.js"
# alias perhour=" clear;casperjs /Users/Josh/Documents/scrapping-for-a-better-future_project/scrapping_scripts/hourlypay.js"
#ssh
alias tesla="ssh chajmart@tesla.cs.iupui.edu"
#getting ip
alias ip="ipconfig getifaddr en0"

alias path="echo $PWD"
alias cpath="path | pbcopy" #copies path to clipboard
#removing clear DS_store
alias cleards="find . -type f -name '*.DS_Store' -ls -delete"

eval $(thefuck --alias)

