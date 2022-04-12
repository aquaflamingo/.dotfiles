function load_nvm() {
	 # Language specific environment
	 export NVM_DIR="$HOME/.nvm"
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
}

function load_n() {
	 export N_PREFIX=$HOME/.n
	 export PATH=$N_PREFIX/bin:$PATH
}
