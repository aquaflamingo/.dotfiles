"""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" Close buffers vim
autocmd BufReadPost fugitive://* set bufhidden=delete

" Use GS for Git Status
nnoremap <leader>gs :Git<cr>
