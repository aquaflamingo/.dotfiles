# !/bin/sh
# Installs developers tools
#
cat <<-"EOF"
##################################################
# INSTALLING DEVELOPER TOOLS FOR DEVELOPMENT
##################################################
EOF
# Start shell environment setup

echo "\tA. Setting up ZSH Shell"
echo "\t\tA.1 Linking zshrc and dotfiles"
ln -s $dotfiles_location/zsh/zshrc $HOME/.zshrc
source ~/.zshrc

echo "\t\tA.2 Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\t\tA.3 Linking oh-my-zsh"
ln -s $dotfiles_location/zsh/custom $HOME/.oh-my-zsh/custom

source ~/.zshrc

echo "\t\tA.4 Installing oh-my-zsh extensions"
# Auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install git extensions
echo "\tB. Installing extensions for git: diff-so-fancy"
brew install diff-so-fancy

# Update git configurations to use diff-so-fancy
echo "\t\tB.1 Modifying git configurations for diff-so-fancy"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

echo "\t\tB.2 Copying git configurations"
cp $dotfiles_location/git/gitconfig $HOME/.gitconfig

echo "\t\tB.3 Setting user"
echo "What is your git name: "
read -rs -k 1 gitname
git config --global user.name $gitname

echo "What is your git email: "
read -rs -k 1 gitemail
git config --global user.email $gitemail

echo "\t\tB.4 Generating an SSH key"
ssh-keygen -t ed25519 -C $gitemail

echo "\t\tB.5 Installing GitHub cli"
brew install gh

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
ln -s $dotfiles_location/nvim ~/.config/nvim

ln -s ~/.config/nvim/init.vim ~/.vimrc
ln -s ~/.config/nvim ~/.vim

echo "\t\tC.5 Install ripgrep"
brew install ripgrep

echo "\t\tC.6 You will need to install neovim plugins by running neovim and :PlugInstall manually"

