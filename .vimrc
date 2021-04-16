set hidden

" Create default mappings
let g:NERDCreateDefaultMappings = 1
let g:airline#extensions#hunks#enabled=1



 " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1"
"
" vim:set ft=vim et sw=2:
" Disable highlight white space after "[]".
let g:v_highlight_array_whitespace_error = 0

" Disable highlight white space around the communications operator that don't follow the standard style.
let g:v_highlight_chan_whitespace_error = 0

" Disable highlight instances of tabs following spaces.
let g:v_highlight_space_tab_error = 0

" Disable highlight trailing white space.
let g:v_highlight_trailing_whitespace_error = 0

" Disable highlight function calls.
let g:v_highlight_function_calls = 0

let g:v_highlight_fields = 0

set nocompatible              " be iMproved, required

syntax enable
filetype plugin indent on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
" 
Plugin 'VundleVim/Vundle.vim' 
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dmdque/solidity.vim'
Plugin 'octol/vim-cpp-enhanced-highlight' 
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes' 
Plugin 'rafi/awesome-vim-colorschemes'


" The following are examples of different formats supported.  Keep Plugin
" commands between vundle#begin/end.  plugin on GitHub repo Plugin
" 'tpope/vim-fugitive' plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9' Git plugin not hosted on GitHub

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin' The sparkup vim script is in a
" subdirectory of this repo called vim.  Pass the path to set the runtimepath
" properly.  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} Install L10 and avoid a 
" Naming conflict if you've already installed a different version somewhere
" else.  Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help :PluginList       - lists configured plugins :PluginInstall    -
" installs plugins; append `!` to update or just :PluginUpdate :PluginSearch
" foo - searches for foo; append `!` to refresh local cache :PluginClean
" - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ Put your non-Plugin stuff
" after this line


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

let g:airline_theme='papercolor' 
let g:airline#extensions#tabline#enabled=1 
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = '⚡'
let g:airline_left_alt_sep = '⚡'
let g:airline_right_sep = '⚡'
let g:airline_symbols.linenr = '☰'
let g:airline_right_alt_sep = '⚡'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#fzf#enabled=1

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

call plug#begin() 
Plug 'huyvohcmc/atlas.vim'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-rooter' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } 
Plug 'junegunn/fzf.vim' 
Plug 'Shougo/denite.nvim' 
Plug 'roxma/nvim-yarp' 
Plug 'roxma/vim-hug-neovim-rpc' 
Plug 'jiangmiao/auto-pairs' 
Plug 'easymotion/vim-easymotion' 
Plug 'lfilho/cosco.vim' 
Plug 'jremmen/vim-ripgrep' 
Plug 'mbbill/undotree' 
Plug 'preservim/nerdtree' 
Plug 'preservim/nerdcommenter' 
Plug 'terryma/vim-multiple-cursors' 
call plug#end()


if executable('rg') 
    let g:rg_derive_root='true' 
endif


"nnoremap <leader>; A;<ESC>
inoremap <C-p> <end><SPACE>{<CR>}<up><ESC>o

let g:javascript_plugin_flow = 1



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
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>c :s/^/\/\//<CR>
vnoremap <leader>r :s/\/\///g<CR>
inoremap jj <ESC>
nmap <C-i> <plug>(YCMHover)


nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
"set laststatus=2
"let g:rainbow_active = 1
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
let g:airline_powerline_fonts = 0

set ignorecase
set smartcase
set gdefault
nnoremap gd :YcmCompleter GoTo<CR>
let g:ycm_auto_hover=''
let g:ycm_add_preview_to_completeopt=0
