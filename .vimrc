

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1


set nocompatible
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'ycm-core/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required

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

call plug#begin()
Plug 'ap/vim-buftabline'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'fatih/molokai'
Plug 'cormacrelf/vim-colors-github'
Plug 'ziglang/zig.vim'
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
nnoremap gr :YcmCompleter GoToReferences<CR>
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

autocmd InsertEnter,InsertLeave * set cul!
set autowrite
set encoding=utf-8
"ensure zig is a recognized filetype
"
set tabstop=4
autocmd BufNewFile,BufRead *.zig set filetype=zig
filetype plugin indent on    " required
set shiftwidth=4
autocmd FileType go setlocal shiftwidth=8 tabstop=8 
" On pressing tab, insert 4 spaces
set expandtab

let g:ycm_language_server =
  \ [
  \{
  \     'name': 'zls',
  \     'filetypes': [ 'zig' ],
  \     'cmdline': [ '/home/bitbasebit/zls/zls' ]
  \    }
  \ ]
filetype plugin indent on    " required
set background=dark
set termguicolors
:colo everforest
