" start terminal in insert mode
augroup myTerminal
  autocmd!
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

function! OpenTerminal()
  split term://fish
  resize 10
endfunction

" open terminal on ctrl+n
nnoremap <C-t> :call OpenTerminal()<CR>
inoremap <C-t> <Esc>:call OpenTerminal()<CR>

"Escape insert mode in the vim terminal using <Esc> key
tnoremap <Esc> <C-\><C-n>
