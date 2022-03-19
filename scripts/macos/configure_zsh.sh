# !/bin/sh
# Configures ZSH

dotfiles_location="$HOME/.dotfiles"

echo "\tA. Setting up ZSH Shell"
echo "\t\tA.1 Linking zshrc and dotfiles"
ln -s $dotfiles_location/zsh/zshrc $HOME/.zshrc

source ~/.zshrc

echo "\t\tA.2 Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\t\tA.3 Linking oh-my-zsh"
ln -s $dotfiles_location/zsh/custom $HOME/.oh-my-zsh/custom

echo "\t\tA.4 Installing oh-my-zsh extensions"
# Auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
