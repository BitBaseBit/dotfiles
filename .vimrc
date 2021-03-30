" BEGIN COC CONFIG
" TextEdit might fail if hidden is not set.
set hidden
let g:ale_disable_lsp = 1
set conceallevel=1

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:zig_fmt_autosave = 0


" Create default mappings
let g:NERDCreateDefaultMappings = 1

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

filetype off
filetype plugin indent on
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')

"this is for solidity compile with :make
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost make nested copen
augroup END
" let Vundle manage Vundle, required
" 
Plugin 'VundleVim/Vundle.vim' 
Plugin 'dense-analysis/ale'
Plugin 'dmdque/solidity.vim'
Plugin 'codota/tabnine-vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
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

let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe' 
set backspace=2

let g:airline_theme='solarized' 
let g:airline#extensions#tabline#enabled = 1 

set termguicolors

colorscheme solarized8

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ollykel/v-vim'
Plug 'godlygeek/tabular'
Plug 'sainnhe/gruvbox-material'
Plug 'airblade/vim-rooter' 
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } 
Plug 'junegunn/fzf.vim' 
Plug 'Shougo/denite.nvim' 
Plug 'roxma/nvim-yarp' 
Plug 'roxma/vim-hug-neovim-rpc' 
Plug 'ayu-theme/ayu-vim' 
Plug 'jiangmiao/auto-pairs' 
Plug 'easymotion/vim-easymotion' 
Plug 'lfilho/cosco.vim' 
Plug 'jremmen/vim-ripgrep' 
Plug 'mbbill/undotree' 
Plug 'preservim/nerdtree' 
Plug 'preservim/nerdcommenter' 
Plug 'morhetz/gruvbox' 
Plug 'xero/blaquemagick.vim' 
Plug 'sheerun/vim-polyglot'
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
inoremap jj <ESC>

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

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
