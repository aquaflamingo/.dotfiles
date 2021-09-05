call plug#begin("~/.config/nvim/bundle")
" Basics
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

" APPEARANCE
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" LANGUAGE SERVER PROTOCOLS
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" TODO - remove complete
" LANGUAGES
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'vim-crystal/vim-crystal'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim Tmux
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
