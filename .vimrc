set nocompatible              " be iMproved, required
syntax enable
set t_Co=256
set background=dark
"================================================================
"			Vundle Plugins
"================================================================
filetype off                  " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
"================================================================
"		     Airline Customization
"================================================================
colorscheme solarized
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_ocean'

"Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'),dict(__file__=activate_this))
EOF

"Autocomplete window go away
let g:ycm_autoclose_preview_window_after_completion=1		
"comma-g will go to definittion
map <leader>g	:YcmCompleter GoToDefinitionElseDeclaration<CR>

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

set splitbelow 
set splitright

set laststatus=2
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-U> :UndotreeToggle<cr>


"UTF8 Support
set encoding=utf-8

"UI Config
set number              "show line numbers 
set showcmd             "show commandin bottom bar
set cursorline          "highlight current line
set wildmenu            "visual autocomplete for command menu
set lazyredraw          "redraw only when we need to
set showmatch           "highlight matching parentheses


"Folding
set foldenable          "enable folding
set foldlevelstart=10   "open most folds by default
set foldnestmax=10      "10 nested fold max
nnoremap <space> za
set foldmethod=indent   "fold based on indent level

"Leader Shortcuts
let mapleader=","       "leader is comma
inoremap jk <esc> 
