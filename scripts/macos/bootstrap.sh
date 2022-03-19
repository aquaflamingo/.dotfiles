#!/bin/bash
#
# macos/bootstrap.sh
#
# An installation script which installs various
# developer dependencies and environmental programs
# for a new MacOS developer machine.
#
echo "Welcome to your new Mac! Running setup scripts"

# Perform Xcode Install
echo "Running xcode-select --install"
xcode-select --install

echo "Link ZSH"
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh $HOME/.zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s $HOME/.dotfiles/zsh/custom $HOME/.oh-my-zsh/custom
source ~/.zshrc

# Auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Homebrew
echo "Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git
echo "Installing git via brew"
brew install git

echo "Installing GitHub cli"
brew install gh

# Start installation process for neovim ide
echo "Install neovim"
brew install neovim

echo "Installing tmux"
brew install tmux

echo "Installing fzf and completions"
# Installs FZF according to:
# https://github.com/junegunn/fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

echo "Install ripgrep"
brew install ripgrep

echo "Installing GoLang"
brew install go
mkdir -p $GOPATH/{bin,src,pkg}

echo "Install Rbenv and Ruby 3"
brew install rbenv ruby-build
rbenv init
eval "$(rbenv init - zsh)"

# Install Ruby 3
rbenv install 3.0.0
rbenv rehash

echo "Install Python 3"
brew install pyenv
pyenv install 3.9.2
pip install pyright

echo "Install Crystal" 
brew install crystal

echo "Install Rust"
brew install rustup
rustup init 

# Install git extensions
echo "Install git diff-so-fancy"
brew install diff-so-fancy

# Update git configurations to use diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

echo "TODO"
echo "1. Install Node"
echo "Install via https://github.com/nvm-sh/nvm"
echo "Install yarn, node"

echo "2. Install Crystalline LSP"
echo "Install Crystal via: https://github.com/elbywan/crystalline"

echo "3. Configure Git config"
echo "4. Create new SSH key"
