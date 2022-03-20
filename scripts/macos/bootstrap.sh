#!/bin/zsh
#
# macos/bootstrap.sh
#
# An installation script which installs various
# developer dependencies and environmental programs
# for a new MacOS developer machine.
#
echo "Welcome to your new Mac! Running setup scripts"

DOTFILES_PATH=$1

echo "Starting install based on DOTFILES_PATH: $DOTFILES_PATH"

echo "Proceed? (Y/n): "
read -rs -k  REPLY

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	 echo "Exiting early. Set dotfile path if desired"
	 exit 1
fi

#=============================================================
# Functions

install_borg () {
	 echo "\tInstalling borg.."
	 brew install borgbackup 
}

install_crystal() {
	 echo "\tInstalling Crystal.." 
	 brew install crystal
}

install_rust() {
	 echo "\tInstalling Rust.."
	 brew install rustup
	 rustup init 
}

install_python() {
	 echo "\tInstalling Python 3..."
	 brew install pyenv
	 pyenv install 3.9.2
}

install_ruby() {
	 echo "\tInstalling Rbenv and Ruby 3..."
	 brew install rbenv ruby-build
	 rbenv init
	 eval "$(rbenv init -)"

	 # Install Ruby 3
	 rbenv install 3.0.0
	 rbenv global 3.0.0
	 rbenv rehash
}

install_nvim_ide() {
	 echo "\tInstalling and setting up neovim IDE..."
	 # Install neovim
	 brew install neovim

	 # Install tmux
	 brew install tmux

	 # Installs FZF according to:
	 # https://github.com/junegunn/fzf
	 brew install fzf

	 # To install useful key bindings and fuzzy completion:
	 $(brew --prefix)/opt/fzf/install

	 # Install ripgrep
	 brew install ripgrep

	 # Link config to dotfile config
	 ln -s $DOTFILES_PATH/nvim ~/.config/nvim
	 ln -s ~/.config/nvim/init.vim ~/.vimrc
	 ln -s ~/.config/nvim ~/.vim
}

install_zsh() {
	 echo "\tInstalling ZSH with oh-my-zsh..."
	 # Link .dotfiles zsh to home directories
	 ln -s $DOTFILES_PATH/zsh/zshrc $HOME/.zshrc
	 ln -s $DOTFILES_PATH/zsh $HOME/.zsh

	 # Install oh-my-zsh
	 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	 # Link oh-my-zsh with dotfile oh-my-zsh
	 ln -s $DOTFILES_PATH/zsh/custom $HOME/.oh-my-zsh/custom
	 source ~/.zshrc

	 # Add auto suggest plugin
	 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	 # Add syntax highlighting plugin
	 git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	 mkdir -p $HOME/.priv
	 touch $HOME/.priv/zsh.priv.env
}

install_golang() {
	 echo "\tInstalling GoLang..."
	 brew install go
	 mkdir -p $GOPATH/{bin,src,pkg}
}

# ========================================================================
# Script Start

# Perform Xcode Install
echo "Running xcode-select --install"
xcode-select --install

if read -q "choice?Setup ZSH with oh-my-zsh? (Y/n): "; then
	 install_zsh
else 
	 echo "\tContinue"
fi

# Install Homebrew
if ! command brew 2>&1 /dev/null; then
	 echo "Installing homebrew"
	 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install git
if ! command brew 2>&1 /dev/null; then
	 echo "Installing git via brew"
	 brew install git
fi

# Install git extensions
# Update git configurations to use diff-so-fancy
echo "Installing git diff-so-fancy"
brew install diff-so-fancy

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

if ! command gh 2>&1 /dev/null; then
	 echo "Installing GitHub cli"
	 brew install gh
fi

if read -q "choice?Setup neovim IDE? (Y/n): "; then
	 install_nvim_ide
else
	 echo "	Continue"
fi

if read -q "choice?Setup Go lang? (Y/n): ";then 
	 install_golang
else
	 echo "	Continue"
fi

if read -q "choice?Setup Ruby? (Y/n): "; then
	 install_ruby
else
	 echo "	Continue"
fi

if read -q "choice?Setup Python? (Y/n): "; then
	 install_python
else
	 echo "	Continue"
fi

if read -q "choice?Setup Crystal? (Y/n): "; then
	 install_crystal
else
	 echo "	Continue"
fi

if read -q "choice?Setup Rust? (Y/n): "; then
	 install_rust
else
	 echo "	Continue"
fi

if read -q "choice?Setup Borg? (Y/n): "; then
	 install_borg
else
	 echo "	Continue"
fi

read -d '' todo <<-"EOM"
# DotFile Setup Finish

These are the remaining items you will need to install manually if desired.

## Other languages and tools
* Install Node.js
* Install via https://github.com/nvm-sh/nvm
* Install yarn, node

## Language servers
These language serers are currently configured for neomvim. You will either need to install them or change the LSP configuration.
FULL LIST https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

* See Ruby https://github.com/castwide/solargraph
* See Python https://github.com/microsoft/pyright
* See Rust https://rust-analyzer.github.io/manual.html#installation
* See Go https://github.com/golang/tools/tree/master/gopls
* See Bash https://github.com/bash-lsp/bash-language-server
* See Crystal https://github.com/elbywan/crystalline
* See Docker https://github.com/rcjsuen/dockerfile-language-server-nodejs
* See Vim https://github.com/iamcco/vim-language-server
* See C# https://github.com/omnisharp/omnisharp-roslyn
* See Terraform https://github.com/hashicorp/terraform-ls

## Git
* Configure Git config
* Create new SSH key
* Create new GPG key
* Add SSH key and GPG key to GitHub
* Add SSH key and GPG key to GitLab

## Private
Create your private variables via ~/.priv
EOM

echo "🚀 Nearly there. Finish setting up by completing tasks in: ~/todo-finish-setup.md"

echo $todo > ~/todo-finish-setup.md
