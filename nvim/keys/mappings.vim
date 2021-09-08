" Key Maps

" Use key to toggle between light and dark mode
map <Leader>* :let &background = ( &background == "dark"? "light" : "dark" )<CR>

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

" Quickly open/reload vim
nnoremap <leader>ev :split ~/.vimrc<CR>  
nnoremap <leader>sv :source ~/.vimrc<CR>    

" Create leader key map for omnifunc 
" call
imap <Leader><Leader> <C-x><C-o>

" Paste and copy from system clipboard
nnoremap <leader>P "+p
vmap <leader>Y "+y
