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
alias ,ed="vim $DOTFILES"
alias ,eg="vim ~/.gitconfig"
alias ,eza="vim ~/.zsh/alias.zsh"
alias ,ev="vim ~/.vimrc"
alias ,et="vim ~/.tmux.conf"

# Terminal
alias cl="clear"
alias reload="source ~/.zshrc"

# git
alias ga="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gp="git push"
alias gbr="git branch | cat"
alias gf="git commit --fixup"
alias grom="git rebase origin/master"
alias grum="git rebase upstream/master"
alias grename="git branch -m"

