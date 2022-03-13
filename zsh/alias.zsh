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
alias gfrom="git fetch origin/main && git reset --hard origin/main"
# Git fetch and reset upstream
alias gfrum="git fetch upstream/main && git reset --hard upstream/main"
# Rebase origin main
alias grom="git rebase origin/main"
# Rebase upstream main
alias grum="git rebase upstream/main"
alias grename="git branch -m"

