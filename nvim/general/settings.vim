"""""""""""""""""""""""""""""""""""""""""""""""
" APPEARANCE 
"""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

" Set current colour scheme
colorscheme challenger_deep 


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers and Editor Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Syntax highlighting
filetype plugin indent on
if !exists("g:syntax_on")
    syntax enable
endif 

" Automatically change current working directory to the file being edited
" set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""
set incsearch     " find next match as we type the search
set hlsearch      " Highlight searchs by default
set ignorecase    " Ignore case when searching
set smartcase     " unless we type a capital

