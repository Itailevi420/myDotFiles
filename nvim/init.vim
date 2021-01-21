"  
"  
"     _/_/_/    _/                _/      _/                              _/   
"      _/    _/_/_/_/    _/_/_/          _/          _/_/    _/      _/        
"     _/      _/      _/    _/  _/      _/        _/_/_/_/  _/      _/  _/     
"    _/      _/      _/    _/  _/      _/        _/          _/  _/    _/      
" _/_/_/      _/_/    _/_/_/  _/      _/_/_/_/    _/_/_/      _/      _/       
"  
"  
"                       _________ _______  _______  _______ 
"              |\     /|\__   __/(       )(  ____ )(  ____ \
"              | )   ( |   ) (   | () () || (    )|| (    \/
"              | |   | |   | |   | || || || (____)|| |      
"              ( (   ) )   | |   | |(_)| ||     __)| |      
"               \ \_/ /    | |   | |   | || (\ (   | |      
"                \   /  ___) (___| )   ( || ) \ \__| (____/\
"                 \_/   \_______/|/     \||/   \__/(_______/
"              
" ####### Sane settings  #######
syntax on

set shell=/bin/zsh
let $SHELL = "/bin/zsh"
"set guicursor=
"set noshowmatch
set mouse=a
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set cursorline

" ####### VimPlug Config #######
" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
augroup myPlug 
  autocmd!
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
augroup END

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'moll/vim-bbye'
Plug 'szw/vim-maximizer' "Maximizes and restores the current window in Vim.
Plug 'puremourning/vimspector' "vimspector - A multi language graphical debugger for Vim
Plug 'vimwiki/vimwiki'         "my personal Wiki
Plug 'machakann/vim-sandwich'
Plug 'andymass/vim-matchup'

"themes
Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ####### SomeSettings   #######
" Open new split panes to right and bottom
set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox
set background=dark

"####### General keymaps#######
let mapleader = " "
"let maplocalleader =";"

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
"nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>_ :resize -3<CR>
nnoremap <Leader>) :resize +3<CR>
"Move line down in visual mode
vnoremap J :m '>+1<CR>gv=gv
"Move line up visual mode
vnoremap K :m '<-2<CR>gv=gv
" Deletes a line in visual mode by pressing ["X"]
vnoremap X "_d
inoremap <C-c> <esc>

" ####### plugin conf    #######

" match-up should automatically disable matchit and matchparen, but if you 
" are still having trouble, try placing this near the top of your vimrc:
let g:loaded_matchit = 1

"MaximizeToggle plugin
nnoremap <silent><Leader>z :MaximizerToggle!<CR>

"####### Bbye PlugIn ########
"Bbye allows you to do delete buffers (close files) without closing your 
"windows or messing up your layout.
nnoremap <Leader>q :Bdelete<CR>
"Buffer delete vs wipeout
"Vim has two commands for closing a buffer: :bdelete and :bwipeout. 
"The former removes the file from the buffer list, clears its options, 
"variables and mappings. However, it remains in the jumplist, 
"so Ctrl-o takes you back and reopens the file. If that's not what you want,
"use :bwipeout or Bbye's equivalent :Bwipeout where you would've used :bdelete.
nnoremap <Leader>q! :Bwipeout<CR>
"Closing all open buffers and files
"Occasionally you'll want to close all open buffers and files while leaving your pristine window setup as is. That's easy. Just do:
"Closing all open buffers and files
"Occasionally you'll want to close all open buffers and files while leaving
"your pristine window setup as is. That's easy. Just do:
":bufdo :Bdelete

" ######## FuGITive #######
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>


" ####### FZF #######
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" ###### UNDOTREE ######

"" undotree remap
nnoremap <leader>u :UndotreeToggle<cr>
"
" undotree window width
"if !exists('g:undotree_SplitWidth')
    "if g:undotree_ShortIndicators == 1
        "let g:undotree_SplitWidth = 24
    "else
        "let g:undotree_SplitWidth = 30
    "endif
"endif

" ###### VimSpector #######


  fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" ###### VimWiki #######
" vim wiki settings 
set nocompatible 
filetype plugin on 
let wiki = {'path': '~/vimwiki',
           \ 'syntax': 'markdown', 'ext': '.md'} 
let wiki.template_default = 'default' 
let wiki.template_ext = '.html' 
let wiki.nested_syntaxes = {'python': 'python', 'bash': 'sh', 'ts':'typescript'} 
let g:vimwiki_list = [wiki] 


" ######## IndentLinePlugIn ########
let g:indentLine_char_list = ['▏','▏','▏','▏', '¦', '┆', '┊']

" ####### Coc-extentions #######
"let g:coc_global_extensions = [
      "\'coc-highlight',
      "\'coc-python',
      "\'coc-explorer',
      "\'coc-json', 
      "\'coc-git',
      "\'coc-fish',
      "\'coc-css',
      "\'coc-marketplace',
      "\'coc-html',
      "\'coc-tsserver',
      "\'coc-syntax',
      "\'coc-spell-checker',
      "\'coc-snippets',
      "\'coc-prettier'
      "\]

" ####### Coc-settings   #######
"function! AuCocExplorerAutoOpen()
"    let l:use_floating = 0
"
"    " Auto-open explorer when there's no file to show.
"    if @% == '' || @% == '.'
"        if l:use_floating
"            exe ':CocCommand explorer --position floating'
"        else
"            autocmd User CocExplorerOpenPost ++once exe ':only'
"            exe ':CocCommand explorer'
"        endif
"    endif
"endfunction
"autocmd User CocNvimInit call AuCocExplorerAutoOpen()

augroup CocExplorer
  autocmd!
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



"----Coc-Prettier ----------------------------"

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <leader>p :Prettier<CR>

"----Coc-Prettier ----------------------------"

  " GoTo code navigation.
  nmap <leader>gd <Plug>(coc-definition)
  nmap <leader>gy <Plug>(coc-type-definition)
  nmap <leader>gi <Plug>(coc-implementation)
  nmap <leader>gr <Plug>(coc-references)
  nmap <leader>rr <Plug>(coc-rename)
  nmap <leader>g[ <Plug>(coc-diagnostic-prev)
  nmap <leader>g] <Plug>(coc-diagnostic-next)
  nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
  nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
  nnoremap <leader>cr :CocRestart

"" Coc explorer
nnoremap <leader>e :CocCommand explorer<CR>


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end



" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" #######  folding logic ####### 
  augroup myFold 
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
  augroup END



" ######## My Vim Functions ########
  "source $HOME/.config/nvim/myVimScripts/MaximizeToggle.vim
  source $HOME/.config/nvim/myVimScripts/TrimWhitespace.vim
  source $HOME/.config/nvim/myVimScripts/ExeMacroOVR.vim
  source $HOME/.config/nvim/myVimScripts/WinMove.vim
  source $HOME/.config/nvim/myVimScripts/myTerminal.vim
  source $HOME/.config/nvim/myVimScripts/pdfPreview.vim

