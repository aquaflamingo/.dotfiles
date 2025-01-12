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
alias gco="git checkout"
alias gp="git push"
# Print branches
alias gbr="git branch | cat"
# Git fixup commit
alias gf="git commit --fixup"
# Git fetch and reset
alias gfrom="git fetch origin/main && git reset --hard origin/main"
# Git fetch and reset upstream
alias gfrum="git fetch upstream/main && git reset --hard upstream/main"
# Rebase origin main
alias grom="git rebase origin/main"
# Rebase upstream main
alias grum="git rebase upstream/main"
alias grename="git branch -m"

alias be="bundle exec"
