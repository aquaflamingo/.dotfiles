""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ripgrep 
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-f> :Rg 

" Set grep executable to RipGrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF 
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use FZF and RipGrep to search for files
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


" Set layout for FZF Window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


" Set FZF Split Hot Keys
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Set FZF Keys for searching
nnoremap <C-p> :Files<CR>
nnoremap <C-G> :GFiles<CR>
nnoremap <C-y> :Buffers<CR>

