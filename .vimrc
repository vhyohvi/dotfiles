set nocompatible              " be iMproved, required
syntax enable
set t_Co=256
"set background=dark
set noshowmode

"Leader Shortcuts
"let mapleader=","
let g:mapleader=","
"let maplocalleader=","
inoremap jk <esc> 

"split navigations
set splitbelow 
set splitright
set laststatus=2
nnoremap <C-T> :vsp 
nnoremap <C-D> :sp 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
"colorscheme codeschool

nnoremap <C-U> :UndotreeToggle<cr>
nnoremap <C-O> :NERDTreeToggle<cr>
nnoremap ; :Files<CR>

nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

set pastetoggle=<C-P>

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
hi LineNr ctermfg=244   "numbers are grey
hi! VertSplit ctermfg=117 ctermbg=087 term=NONE

syntax enable
"Spaces and Tabs
set expandtab
set tabstop=4
au BufNewFile,BufRead *.py, *.sh
    \ set tabstop=4		"number of visual spaces per TAB
    \ set softtabstop=4		"number of spaces in tab when editing
    \ set autoindent
    \ set expandtab		"tabs are spaces
"    \ set shiftwidth=4
    \ set textwidth=100
    \ set fileformat=unix
"autocmd BufWritePost *.py call Flake8()
"autocmd BufRead,BufNewFile *.py
let python_highlight_all=1

"Folding
set foldenable          "enable folding
set foldlevelstart=10   "open most folds by default
set foldnestmax=10      "10 nested fold max
nnoremap <space> za
set foldmethod=indent   "fold based on indent level

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

"Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'),dict(__file__=activate_this))
EOF


so ~/.vim/plugins.vim

"let macvim_skip_colorscheme = 1
"let g:lightline = {
"  \   'colorscheme': 'one', 
"  \   'active': {
"  \     'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
"  \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
"  \   }
"  \ }
let g:airline#extensions#tabline#enabled = 1
