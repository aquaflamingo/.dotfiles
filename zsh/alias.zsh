
# dirs
alias \@badtb='cd ~/dev/book/badtb-app'
alias \@tradebaybot='cd ~/dev/tradebay-bot-go'

# vim
alias vimold='vim'
alias v='vim'
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
alias ,ez="vim ~/.zshrc"
alias ,ev="vim ~/.vimrc"
alias ,et="vim ~/.tmux.conf"

# Terminal
alias cl="clear"
alias reload="source ~/.zshrc"

# git
alias ga="git add -A"
alias gadd="git add -A"
alias gcommit="git commit"
alias gcm="git commit -m"
alias gbr="git branch | cat"
alias gf="git commit --fixup"
alias grename="git branch -m"

# Youtube
alias youtube='youtube-dl --extract-audio --audio-format mp3'

