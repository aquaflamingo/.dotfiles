# dirs
alias \@go=$GOPATH
alias \@dotfiles='~/.dotfiles'
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
# Print branches
alias gbr="git branch | cat"
# Git fixup commit
alias gf="git commit --fixup"
# Git fetch and reset
alias gfrom="git rebase origin/master && git reset --hard origin/master"
# Git fetch and reset upstream
alias gfrum="git rebase upstream/master && git reset --hard upstream/master"
# Rebase origin master
alias grom="git rebase origin/master"
# Rebase upstream master
alias grum="git rebase upstream/master"
alias grename="git branch -m"

