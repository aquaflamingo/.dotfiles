# FZF bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ignore node modules
# Ignore git files
# Ignore python files in venv and __pycache__
# Ignore target directory in rust
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,env/*,venv/*,*/__pycache__/*,target/*}"'
