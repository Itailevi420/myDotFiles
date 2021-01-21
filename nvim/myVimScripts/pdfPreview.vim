" TODO: If zathura open, refresh
function! Preview()
		:call Compile()
		execute "! zathura /tmp/op.pdf &"
endfunction

function! Compile()
		let extension = expand('%:e')
		if extension == "ms"
				execute "! groff -ms % -T pdf > /tmp/op.pdf"
		elseif extension == "tex"
				execute "! pandoc -f latex -t latex % -o /tmp/op.pdf"
		elseif extension == "md"
				execute "! pandoc % -s -o /tmp/op.pdf"
		endif
endfunction


noremap <leader>v :call Preview()<CR><CR><CR>
noremap <leader>vq :call Compile()<CR><CR>
