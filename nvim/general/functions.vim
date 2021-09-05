" Functions

" When inside a buffer use :W to create the parent directory and save the
" buffer
function WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction

command! W call WriteCreatingDirs()
