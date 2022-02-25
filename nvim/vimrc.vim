

"
"
"     _/_/_/    _/                _/      _/                              _/
"      _/    _/_/_/_/    _/_/_/          _/          _/_/    _/      _/
"     _/      _/      _/    _/  _/      _/        _/_/_/_/  _/      _/  _/
"    _/      _/      _/    _/  _/      _/        _/          _/  _/    _/
" _/_/_/      _/_/    _/_/_/  _/      _/_/_/_/    _/_/_/      _/      _/
"
"
"                           _       _ __        _
"                          (_)___  (_) /__   __(_)___ ___
"                         / / __ \/ / __/ | / / / __ `__ \
"                        / / / / / / /__| |/ / / / / / / /
"                       /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" ####### Sane settings  #######

syntax on
set nocompatible
filetype plugin on


set shell=/bin/zsh
let $SHELL = "/bin/zsh"
set nohlsearch
"set ignorecase
set mouse=a
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
"set nu relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set cursorline
set viminfo='1000

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

Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'moll/vim-bbye'
Plug 'szw/vim-maximizer' "Maximizes and restores the current window in Vim.
Plug 'puremourning/vimspector' "vimspector - A multi language graphical debugger for Vim
Plug 'vimwiki/vimwiki'         "my personal Wiki
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'andymass/vim-matchup'
"Plug 'pangloss/vim-javascript' " syntax highlight
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'kevinoid/vim-jsonc'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'sunaku/vim-shortcut'
"themes
Plug 'morhetz/gruvbox'
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
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox
set background=dark
highlight CursorLine ctermbg=Black ctermfg=none guibg=#161617 guifg=none

augroup myCursorLine
  autocmd!
  autocmd InsertEnter * highlight CursorLine ctermbg=Black ctermfg=none guibg=#0e0e0f guifg=none
  autocmd InsertLeave * highlight CursorLine ctermbg=Black ctermfg=none guibg=#161617 guifg=none
augroup END

" ####### Some keymaps  #######
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

"nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
"nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
"nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'

let g:airline_theme='dark'

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
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

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
let g:vimwiki_root = $HOME . '/vimwiki'
let g:vimwiki_global_ext = 0
let wiki = {'path': $HOME . '/vimwiki',
           \ 'syntax': 'markdown', 'ext': '.md'}
let wiki.template_default = 'default'
let wiki.template_ext = '.html'
let wiki.nested_syntaxes = {
      \ 'js': 'javascript',
      \ 'jsx': 'javascriptreact',
      \ 'tsx': 'typescriptreact' ,
      \ 'python': 'python',
      \ 'bash': 'sh',
      \ 'ts':'typescript'}
let g:vimwiki_list = [wiki]

"## fixing tab completion in vimwiki .md files d20220130
" but this disable table_mappings
" but if we want we can use this OPTION insted of <tab> and for auto
" completion use CTRL-n , CTRL-p
let g:vimwiki_key_mappings = { 'table_mappings': 0 } " disable's tab operations



" ######## IndentLinePlugIn ########
let g:indentLine_char_list = ['▏','▏','▏','▏', '¦', '┆', '┊']

" ######## Fzf ########


" ####### Coc-extentions #######
let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-vimlsp',
      \ 'coc-spell-checker',
      \ 'coc-emoji',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-clangd',
      \ 'coc-sh',
      \ 'coc-fzf-preview',
      \ 'coc-omnisharp',
      \ 'coc-tag'
      \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
      "\'coc-highlight',
      "\'coc-python',
      "\'coc-git',
      "\'coc-fish',
      "\'coc-css',
      "\'coc-marketplace',
      "\'coc-syntax',
      "\'coc-snippets',



      "
" ####### Coc-settings   #######

"----------Coc-snippets--------------
"
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
"----------Coc-snippets--------------

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

" ####### Coc-FZF-preview #######
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources git project_mru<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

let g:fzf_preview_command = 'bat --color=always --theme=gruvbox-dark --plain --number {-1}'
let g:fzf_preview_fzf_preview_window_option = 'down:80%'

" Cache directory for mru and mrw
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')
"----Coc-Prettier ----------------------------"

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <leader>p :Prettier<CR>

" ####### Coc-Prettier ----------------------------"

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

" Coc explorer
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
augroup cursorHighlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" ####### Coc keymaps#######
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END



" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap <C-f> and <C-b> for scroll float windows/popups.
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

  " Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" #######  folding logic #######
  augroup myFold
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END


augroup jsonConceal
  autocmd!
  autocmd Filetype json,jsonc
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0
augroup END
