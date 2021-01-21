
"---------Window splitting / movement----------------------------------------
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <leader>h :call WinMove('h')<CR>
nnoremap <silent> <leader>j :call WinMove('j')<CR>
nnoremap <silent> <leader>k :call WinMove('k')<CR>
nnoremap <silent> <leader>l :call WinMove('l')<CR>
"---------END Window splitting / movement----------------------------------------
