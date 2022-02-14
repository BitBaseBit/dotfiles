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
Plug 'jparise/vim-graphql'
Plug 'simrat39/symbols-outline.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tanvirtin/vgit.nvim'
Plug 'TimUntersberger/neogit'
Plug 'vimwiki/vimwiki'

vim.call('plug#end')

vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.wrap = false 
vim.opt.hlsearch = false
vim.opt.equalalways = false
vim.cmd "silent! command Compile !sh /home/greg/dev/nethermind/ts-warp/compile.sh"
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
  nmap 1 :b1<CR>a
  nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>

  nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>

  " find your notes, click enter to create the note if there are not notes that match
  nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
  " insert the id of the note that is found
  nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

  " find the backlinks of the current note all the note that link this note
  nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
  " same as above but insert the found id
  nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

  " find all tags and insert
  nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>

  " start the neuron server and render markdown, auto reload on save
  nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>

  nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
  " go to previous
  nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]



-- init.lua
vim.g.symbols_outline = {
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 35,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    highlight_hovered_item = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}
local neogit = require('neogit')

neogit.setup {}
require('vgit').setup()
require('gitsigns').setup()

