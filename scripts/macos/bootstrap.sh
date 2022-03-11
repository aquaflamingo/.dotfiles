#!/bin/bash
#
# macos/bootstrap.sh
#
# An installation script which installs various
# developer dependencies and environmental programs
# for a new MacOS developer machine.
#
echo "Welcome to your new Mac! Running setup scripts"

cat <<-"EOF"
##################################################
# 1. INSTALLING BASIC MACOS DEPENDENCIES
##################################################
EOF

# Perform Xcode Install
echo "\tA. Running xcode-select --install"
xcode-select --install

# Install Homebrew
echo "\tB. Install homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git
echo "\tC. Installing git via brew"
brew install git


cat <<-"EOF"
##################################################
# 2. INSTALLING DEVELOPER TOOLS FOR DEVELOPMENT
##################################################
EOF
# Start shell environment setup
echo "\tA. Setting up ZSH Shell"
echo "\t\tA.1 Linking zshrc and dotfiles"
ln -s $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
source ~/.zshrc

echo "\t\tA.2 Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\t\tA.3 Installing oh-my-zsh extensions"
# Auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# TODO: stopped here.

# Install git extensions
echo "\tB. Installing extensions for git: diff-so-fancy"
brew install diff-so-fancy

# Update git configurations to use diff-so-fancy
echo "\t\tB.1 Modifying git configurations for diff-so-fancy"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

echo "\t\tB.2 Copying git configurations"
cp $HOME/.dotfiles/git/gitconfig $HOME/gitconfig


# Start installation process for neovim ide
echo "\tC. Installing neovim IDE"
echo "\t\tC.1 Install neovim"
brew install neovim

echo "\t\tC.2 Installing tmux"
brew install tmux

echo "\t\tC.3 Installing fzf and completions"
# Installs FZF according to:
# https://github.com/junegunn/fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Link dotfiles to neovim configrations
echo "\t\tC.4 Linking vimrc and neovim"
ln -s ~/.dotfiles/nvim ~/.config/nvim
