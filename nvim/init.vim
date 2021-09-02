""""""""""""""""""""""""""""""""""""""""""""""""
" Here be the Neovim Configurations!
"
" author: @aquaflamingo
""""""""""""""""""""""""""""""""""""""""""""""""
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
Plug 'hrsh7th/nvim-cmp'
" Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
Plug 'hrsh7th/vim-vsnip'
" Install the buffer completion source
Plug 'hrsh7th/cmp-buffer'

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

"""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE 
"""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

" Set current colour scheme
colorscheme challenger_deep 

" Use key to toggle between light and dark mode
map <Leader>* :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Set layout for FZF Window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""" SOURCE CONTROL

" Close buffers vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Use GS for Git Status
nnoremap <leader>gs :Gst<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" NAVIGATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Navigate windows with C+<HJLK> 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Delete buffers
nnoremap <leader>d :bd!<cr>
" Previous buffer
nnoremap <leader>p :bp<cr>
" Next buffer
nnoremap <leader>n :bn<cr>

" Tabs
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>0 :tablast<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers and Editor Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " Syntax highlighting

set showcmd " show the command you are typing
set lazyredraw " Highlight current line
set list "display invisible chars
set listchars=tab:⇥·,trail:· 
match Error /\v\s+$/ " Show trailing spaces in red


set number " Set line numbers
set tabstop=2 " Tab length of 2
set shiftwidth=3 " Shift of 3
set noexpandtab " Use tab characters not spaces
set spell " Turn spelling on

" Remove highlight on esc
noremap <ESC> :noh<CR><ESC>

" Determine syntax based on file type
if has("autocmd")
	filetype plugin indent on
endif

" Quickly open/reload vim
nnoremap <leader>ev :split ~/.vimrc<CR>  
nnoremap <leader>sv :source ~/.vimrc<CR>    

"""""""""""""""""""""""""""""""""""""""""""""""
" PROGRAMMING LANGUAGE
"""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls' " Use gopls for definitions
let g:go_info_mode='gopls' " Use gopls for info
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     

" Map crystal format
nmap <Leader>c :CrystalFormat<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SERVER PROTOCOLS
"""""""""""""""""""""""""""""""""""""""""""""""
" Python: https://github.com/microsoft/pyright
" Ruby: https://github.com/microsoft/pyright
" TODO: Crystal: https://github.com/elbywan/crystalline
" Go: https://github.com/golang/tools/tree/master/gopls

lua << EOF
	 require'lspconfig'.pyright.setup{}
	 require'lspconfig'.solargraph.setup{}
	 require'lspconfig'.gopls.setup{}
EOF

" Initialize Autocompletion via nvim-cmp
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

" Create leader key map for omnifunc 
" call
imap <Leader><Leader> <C-x><C-o>
"""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""
set incsearch     " find next match as we type the search
set hlsearch      " Highlight searchs by default
set ignorecase    " Ignore case when searching
set smartcase     " unless we type a capital

" Set grep executable to RipGrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Use FZF and RipGrep to search for files
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <C-f> :Rg 

" Set FZF Split Hot Keys
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Set FZF Keys for searching
nnoremap <C-p> :Files<CR>
nnoremap <C-G> :GFiles<CR>
nnoremap <C-y> :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""
" When inside a buffer use :W to create the parent directory and save the
" buffer
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction

command! W call WriteCreatingDirs()
