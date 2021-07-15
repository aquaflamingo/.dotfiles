" NEOVIM CONFIGURATIONS
set nocompatible

call plug#begin("~/.config/nvim/bundle")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Conqure of Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" general 
Plug 'janko/vim-test'

" Go 
Plug 'fatih/vim-go'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'vim-crystal/vim-crystal'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" greppin
Plug 'dyng/ctrlsf.vim'

" Vim Tmux
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set termguicolors
colorscheme challenger_deep
map <Leader>* :let &background = ( &background == "dark"? "light" : "dark" )<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf in floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <C-p> :Files<CR>
nnoremap <C-G> :GFiles<CR>
nnoremap <C-y> :Buffers<CR>

" Use :W to create dir before saving
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction

command! W call WriteCreatingDirs()

" Close buffers vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Testing
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Ctrl SF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordExec
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
"set hid
"au FocusLost * silent! wa

"delete buffer"
nnoremap <leader>d :bd!<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>n :bn<cr>

set clipboard+=unnamedplus

" vim-fugitive
nnoremap <leader>gs :Gst<cr>

" Quickly open/reload vim
nnoremap <leader>ev :split ~/.vimrc<CR>  
nnoremap <leader>sv :source ~/.vimrc<CR>    

" thoughtbot splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remove highlight on esc
noremap <ESC> :noh<CR><ESC>

" ---- end my hot keys

" show the command you are typing
set showcmd

" Highlight current line
set lazyredraw

" Makes the current line stand out with bold and in the numberline

"display invisible chars
set list
set listchars=tab:⇥·,trail:·

"Trailing spaces in red
match Error /\v\s+$/

syntax on " Syntax highlighting

set number " Set line numbers

set tabstop=2
set shiftwidth=3
set noexpandtab " Use tab characters not spaces

" ======== Searching ========
set incsearch     " find next match as we type the search
set hlsearch      " Highlight searchs by default
set ignorecase    " Ignore case when searching
set smartcase     " unless we type a capital

if has("autocmd")
	filetype plugin indent on
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

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ----- END COC

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     

set spell

" vim crystal
nmap <Leader>c :CrystalFormat<cr>
