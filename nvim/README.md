# Neovim

Configurations for neovim.

The setup includes neovim 0.5.0's new native language server protocol

## Usage

I set neovim as my default "vim" and use this alias because I forget.
```
# zsh
alias vim='nvim'
```

Clone repo
```
$ git clone git@github.com:dotfiles .dotfiles
ln -s .dotfiles/nvim ~/.config/nvim
```

Set up symlinks because remembering is hard
```
ln -s ~/.config/nvim/init.vim ~/.vimrc
ln -s ~/.config/nvim ~/.vim
```

## Plugins
### Nvim-Tree
* Install a Nerd Font compatible. 
  * e.g. Ubuntu Mono Complete - 
  * e.g. Fira Code Complete - https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Retina/complete 
* Then set terminal font (or guifont if you are using GUI version of Vim).

# Licence
This repository is licenced under MIT
