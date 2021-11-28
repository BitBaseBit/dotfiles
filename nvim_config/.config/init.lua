local ok, err = pcall(require, "core")

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'neovim/nvim-lspconfig'
Plug 'rhysd/vim-clang-format'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


vim.call('plug#end')

vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.wrap = false 
vim.opt.hlsearch = false
vim.cmd [[
  if has('wsl')
      let g:clipboard = {
            \   'name': 'wslclipboard',
            \   'copy': {
            \      '+': '/mnt/c/Users/vardy/win32yank.exe -i --crlf',
            \      '*': '/mnt/c/Users/vardy/win32yank.exe -i --crlf',
            \    },
            \   'paste': {
            \      '+': '/mnt/c/Users/vardy/win32yank.exe -o --lf',
            \      '*': '/mnt/c/Users/vardy/win32yank.exe -o --lf',
            \   },
            \   'cache_enabled': 1,
            \ }
  endif
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> <C-e> <Plug>(coc-diagnostic-next)

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
  nmap <leader>w <Plug>(easymotion-w)
  nmap <leader>b <Plug>(easymotion-b)
  let g:airline_theme='alduin' 
  let g:airline#extensions#tagbar#flags='f'

]]