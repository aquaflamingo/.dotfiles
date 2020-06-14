# Neovim

Configurations for neovim.

### Plugins
* Languages: `vim-polygot`, `vim-rails`, `vim-go`, `python-mode`
* Plugin System: `vim-plug`
* IDE: `nerdtree`, `nerdcommenter`, `ale`, `vim-test`

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

# Licence
This repository is licenced under MIT
