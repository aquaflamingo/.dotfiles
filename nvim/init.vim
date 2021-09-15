""""""""""""""""""""""""""""""""""""""""""""""""
" Here be the Neovim Configurations!
"
" author: @aquaflamingo

source ~/.config/nvim/vim-plug/plugins.vim

" Plugin Configuration
source ~/.config/nvim/plug-config/fugitive.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/vim-crystal.vim
source ~/.config/nvim/plug-config/vim-go.vim
source ~/.config/nvim/plug-config/ctrlsf.vim
"
" Language Server Protocol 
" https:://github.com/neovim/nvim-lspconfig/blb/master/CONFIG.md
luafile ~/.config/nvim/lua/plugins/lsp-config.lua
luafile ~/.config/nvim/lua/plugins/compe-config.lua

source ~/.config/nvim/general/functions.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/keys/mappings.vim
