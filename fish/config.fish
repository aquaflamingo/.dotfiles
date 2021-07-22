set -g SHELL 'fish'
set -g EDITOR 'nvim'

#########################################
# ENV
#########################################
source (rbenv init - | psub)
source (pyenv init - | psub)
#########################################
# ALIAS
#########################################
# dirs
alias \@go=$GOPATH
alias \@src='~/src/'

# vim
alias vimold='vim'
alias vim='nvim'

# Warn before overwriting
alias rm='rm -i'

# Docker
alias dockeripd="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# python
alias python=python3
alias pip=pip3

# configs
alias ,ez="vim ~/.zsh"
alias ,ef="vim ~/.config/fish/config.fish"
alias ,ev="vim ~/.vimrc"
alias ,et="vim ~/.tmux.conf"

# Terminal
alias cl="clear"
alias reload="source ~/.config/fish/config.fish"

# git
alias ga="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gp="git push"
alias gbr="git branch | cat"
alias gf="git commit --fixup"
alias grc="git rebase --continue"
alias grom="git rebase origin/master"
alias grum="git rebase upstream/master"
alias grename="git branch -m"

alias fish_key_reader="nil"
