"Leader Shortcuts
let mapleader = ","       
let g:mapleader = ","
let maplocalleader = ","
inoremap jk <esc> 
"Invisible character colors 
"
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

set nocompatible              " be iMproved, required
syntax enable
set t_Co=256
set background=dark
set noshowmode

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
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
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

" Powerline setup
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

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
autocmd BufWritePost *.py call Flake8()

