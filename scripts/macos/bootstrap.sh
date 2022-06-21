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

install_extended_deps() {
  # Lynx is a text based web browser
  # https://en.wikipedia.org/wiki/Lynx_%28web_browser%29
  brew install lynx

  # Pandoc is universal document converter
  brew install pandoc
}

# ========================================================================
# Script Start

# Perform Xcode Install
echo "Running xcode-select --install"
xcode-select --install

if read -q "choice?Setup ZSH with oh-my-zsh? (Y/n): "; then
	 install_zsh

   if read -q "choice?Setup extended terminal functionality (Y/n): "; then
     install_extended_deps
   else 
     echo "\tContinue"
   fi
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
