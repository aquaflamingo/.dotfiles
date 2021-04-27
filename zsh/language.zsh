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

# ASDF is a version manager
. /usr/local/opt/asdf/asdf.sh
