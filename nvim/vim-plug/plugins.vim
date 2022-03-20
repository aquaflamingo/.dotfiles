call plug#begin("~/.config/nvim/bundle")
" Basics
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

" APPEARANCE
Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" LANGUAGE SERVER PROTOCOLS
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

" Vim Tmux
Plug 'christoomey/vim-tmux-navigator'

" Tree sitter parsing engine
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
call plug#end()
