" TrimWhitespace in definde files

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrimWhitespace
  autocmd!
  
  autocmd BufWritePre vim,bash,sh,fish,c,c++ :call TrimWhitespace()
augroup END
