# dirs
alias \@go=$GOPATH
alias \@dev='~/dev/'
alias \@tools='~/tools/'
alias \@bot='~/dev/book/badtb-bot'
alias \@book='~/Documents/Writing/badtb/writing'

# vim
alias vimold='vim'
alias vim='nvim'

# Warn before overwriting
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Docker
alias d='docker'
alias dps='docker ps'
alias dockerterm='docker exec -it'
alias dockerbuild='docker build -t'
alias dockeripd="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# python
alias python=python3
alias pip=pip3

# configs
alias ,ez="vim ~/.zsh"
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
alias gcob="git checkout -b"
alias gco="git checkout"
alias gp="git push"
alias gbr="git branch | cat"
alias gf="git commit --fixup"
alias grc="git rebase --continue"
alias grom="git rebase origin/master"
alias grum="git rebase upstream/master"
alias grename="git branch -m"

