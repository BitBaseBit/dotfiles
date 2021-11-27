local ok, err = pcall(require, "core")

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'neovim/nvim-lspconfig'
vim.call('plug#end')
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.wrap = false 
vim.opt.hlsearch = false
local nvim_lsp = require('lspconfig')
local on_attach_ts = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  client.resolved_capabilities.document_formatting = false
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- 

end
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach_ts,
  flags = {
    debounce_text_changes = 150,
  },
} 
nvim_lsp.diagnosticls.setup {
  filetypes = { 'javascript', 'json', 'typescript', 'markdown'},
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint_d',
      typescript = 'eslint_d',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      typescript = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
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
]]
