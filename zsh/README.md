# 🌮 .zshrc 

Set of nice aliases, functions and other preferences for zshrc 

## Usage

After cloning, create a [symbolic
link](https://en.wikipedia.org/wiki/Symbolic_link) from `.zsh/zshrc` to the
`.zshrc` preference file `zsh` looks for:

```
$ ln -s zsh/zshrc .zshrc
```

Also create a symlink to the Oh My ZSH custom directory
```
$ ln -s zsh/custom ~/.oh-my-zsh/custom
```

## Plugins
```bash
# Auto suggest
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Finito!

# Author
@RobertSimoes

## Licence
This repository is licenced under [MIT-0](https://github.com/aws/mit-0).

