" NEOVIM CONFIGURATIONS

set nocompatible

call plug#begin("~/.config/nvim/bundle")
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'conradirwin/vim-bracketed-paste'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'drewtempelmeyer/palenight.vim'

" Linting
Plug 'w0rp/ale'


" Conqure of Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ruby
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" general 
Plug 'janko/vim-test'

" Go 
Plug 'fatih/vim-go'
"
" Language
Plug 'sheerun/vim-polyglot'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Python
Plug 'klen/python-mode'

" greppin
Plug 'dyng/ctrlsf.vim'
call plug#end()

colorscheme palenight
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <C-p> :Files<CR>

" vim-go
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" Use '' to copy to mac system keyboard
vmap '' :w !pbcopy<CR><CR>

" Use :W to create dir before saving
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W call WriteCreatingDirs()

" Resize windows
if bufwinnr(1)
  map + <C-W>>
  map - <C-W><
endif

" Close buffers vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Testing
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Airline
" Tabs for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" NerdTree
" - Toggle
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

" Linting
let g:ale_fixers = {
				 \ 'javascript': ['prettier'],
				 \ 'css': ['prettier'],
				 \ 'ruby': ['standardrb','rubocop'],
         \ }

let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!!'

" Ctrl SF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Tabs
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>0 :tablast<cr>

" ---- start my keys
" Autosave buffers when focus lost
set hid
au FocusLost * silent! wa

"delete buffer"
nnoremap <c-d> :bd!<cr>
nnoremap <c-b> :bp<cr>
nnoremap <c-n> :bn<cr>

" Leader e to edit file in same location as current path
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Remove highlight on esc
noremap <ESC> :noh<CR><ESC>

" ---- end my hot keys

" show the command you are typing
set showcmd
set ruler

" Highlight current line
set cursorline

" Makes the current line stand out with bold and in the numberline
hi CursorLine cterm=bold
hi LineNr cterm=bold ctermfg=0 ctermbg=none

"display invisible chars
set list
set listchars=tab:⇥·,trail:·

"Trailing spaces in red
match Error /\v\s+$/

syntax on " Syntax highlighting

set number " Set line numbers
" set t_Co=256
set tabstop=2
set shiftwidth=3
set noexpandtab " Use tab characters not spaces

" ======== Searching ========
set incsearch     " find next match as we type the search
set hlsearch      " Highlight searchs by default
set ignorecase    " Ignore case when searching
set smartcase     " unless we type a capital

if has("autocmd")
"	filetype plugin indent on
endif

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" ======= COC =======
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
let g:endwise_no_mappings=1 " dont conflict with endwise
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>": "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	 endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader> gd <Plug>(coc-definition)
nmap <leader> gy <Plug>(coc-type-definition)
nmap <leader> gi <Plug>(coc-implementation)
nmap <leader> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ----- END COC

" Optional override for local vimrc files
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

