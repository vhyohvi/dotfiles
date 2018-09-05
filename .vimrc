set nocompatible              " be iMproved, required
syntax enable
set t_Co=256
set background=dark
set noshowmode

"Leader Shortcuts
let mapleader=","
let g:mapleader=","
let maplocalleader=","
inoremap jk <esc> 

set splitbelow 
set splitright
set laststatus=2

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-U> :UndotreeToggle<cr>

nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"UTF8 Support
set encoding=utf-8

"UI Config
set number              "show line numbers 
set relativenumber
set numberwidth=2
set showcmd             "show commandin bottom bar
set cursorline          "highlight current line
set wildmenu            "visual autocomplete for command menu
set lazyredraw          "redraw only when we need to
set showmatch           "highlight matching parentheses
set list

"Folding
set foldenable          "enable folding
set foldlevelstart=10   "open most folds by default
set foldnestmax=10      "10 nested fold max
nnoremap <space> za
set foldmethod=indent   "fold based on indent level

" Numbers are grey
hi LineNr ctermfg=244

"===============================================================================================
"		                	Vundle Plugins
"===============================================================================================
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            
filetype plugin indent on    
"===============================================================================================

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

function! Preserve(command)
	" Save the last search.
	let search = @/
	Save the current cursor position.
	let cursor_position = getpos('.')
	" Save the current window position.
	normal! H
	let window_position = getpos('.')
	call setpos('.', cursor_position)
	" Execute the command.
	execute a:command
	" Restore the last search.
	let @/ = search
	" Restore the previous window position.
	call setpos('.', window_position)
	normal! zt
	" Restore the previous cursor position.
	call setpos('.', cursor_position)
endfunction

function! Autopep8()
	call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

" Shift + F で自動修正
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

"Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'),dict(__file__=activate_this))
EOF

syntax enable
"Spaces and Tabs
au BufNewFile,BufRead *.py
    \ set tabstop=4		"number of visual spaces per TAB
    \ set softtabstop=4		"number of spaces in tab when editing
    \ set autoindent
    \ set expandtab		"tabs are spaces
    \ set shiftwidth=4
    \ set textwidth=79
    \ set fileformat=unix
"autocmd BufWritePost *.py call Flake8()
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
