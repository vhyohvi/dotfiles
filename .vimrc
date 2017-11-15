set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mbbill/undotree'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
if has('gui_running')
	set background=dark
	colorscheme bluish
else
	colorscheme lapis256
endif

"Spaces and Tabs
set tabstop=8		"number of visual spaces per TAB
set softtabstop=0	"number of spaces in tab when editing
set expandtab		"tabs are spaces
set shiftwidth=4
set smarttab
set textwidth=79
set fileformat=unix

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <F5> :UndotreeToggle<cr>


"UTF8 Support
set encoding=utf-8

"UI Config
"show line numbers 
set number
"show command in bottom bar
set showcmd
"highlight current line
set cursorline
"visual autocomplete for command menu
set wildmenu
"redraw only when we need to
set lazyredraw
"highlight matching parentheses
set showmatch


"Folding
"enable folding
set foldenable
nnoremap <space> za
"fold based on indent level
set foldmethod=indent

"Leader Shortcuts
"leader is comma
let mapleader=","
"jk is escape
inoremap jk <esc>
