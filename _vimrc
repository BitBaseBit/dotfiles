set encoding=utf-8
set number

let mapleader = " "


set autoindent
set expandtab
set incsearch
set nowrap

set backspace=2


set undofile

if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

if executable('rg')
    let g:rg_derive_root='true'
endif


inoremap jj <ESC>
