# dirs
alias \@go=$GOPATH
alias \@dotfiles='~/.dotfiles'
alias \@src='~/src/'
alias \@tools='~/src/.util/tools'
alias \@kb='~/KB/'

# vim
alias nv="nvim"

# Warn before overwriting
alias rm='rm -i'
alias mv='mv -i'

# Docker
alias dockeripd="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# python
alias python=python3
alias pip=pip3

# configs
alias ,ez="nvim ~/.zsh"
alias ,ed="nvim $DOTFILES"
alias ,eg="nvim ~/.gitconfig"
alias ,eza="nvim ~/.zsh/alias.zsh"
alias ,ev="nvim ~/.vimrc"
alias ,et="nvim ~/.tmux.conf"

# Terminal
alias cl="clear"
alias reload="source ~/.zshrc"

# git
alias ga="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gcnv="git commit --no-verify"
alias gco="git checkout"
alias gp="git push"
alias gbr="git branch | cat"
alias gf="git commit --fixup"
alias grename="git branch -m"

alias be="bundle exec"
