
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'ycm-core/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set number

let mapleader = " "


set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set nowrap

set backspace=2

set termguicolors
colorscheme nofrils-light

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

<<<<<<< HEAD
call plug#begin()
Plug 'ap/vim-buftabline'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
call plug#end()


if executable('rg')
    let g:rg_derive_root='true'
endif


"nnoremap <leader>; A;<ESC>
inoremap <C-p> <end><SPACE>{<CR>}<up><ESC>o

map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
noremap <leader>s :Rg
nnoremap tab :Tabularize /\S\+;<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
vnoremap tab :Tabularize /\S\+;<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
inoremap <C-e> <ESC>bveU
inoremap <C-j> <ESC>A;

vmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>ag :Tabularize /:=<CR>
vmap <Leader>f :Tabularize /^\s*\S\+\zs/l0c1l0<CR>
vnoremap <leader>c :s/^/\/\//<CR>
vnoremap <leader>r :s/\/\///g<CR>
inoremap jj <ESC>
nmap <C-i> <plug>(YCMHover)
inoremap <C-k> :=
inoremap <C-c> <-

"nnoremap <left> :bp<CR>
"nnoremap <right> :bn<CR>
"nnoremap <left> :bp<CR>
"nnoremap <right> :bn<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>

set ignorecase
set smartcase
set gdefault
nnoremap gd :YcmCompleter GoTo<CR>
let g:ycm_auto_hover=''
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview
set signcolumn=no
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set noshowmode
set noruler
set laststatus=0
set noshowcmd
set cmdheight=1
autocmd InsertEnter,InsertLeave * set cul!
set autowrite
set encoding=utf-8
