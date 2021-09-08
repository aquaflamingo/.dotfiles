# FZF bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ignore node modules
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,env/*,venv/*,*/__pycache__/*}"'
