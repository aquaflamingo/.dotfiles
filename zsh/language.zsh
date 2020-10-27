# Language specific environment

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Ruby Env (rbenv)
export PATH="$HOME/.rbenv/shims/bin:$PATH"
eval "$(rbenv init -)"

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"n

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/robert/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/robert/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/robert/miniconda3/etc/profile.d/conda.sh"
    else
        export PTH="/Users/robert/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
