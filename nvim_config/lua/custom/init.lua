-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

-- hooks.add("install_plugins", function(use)
--    use {
--       "max397574/better-escape.nvim",
--       event = "InsertEnter",
--    }
-- end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
hooks.add("install_plugins", function(use)
   use {
      "Shougo/denite.nvim",
      event = "VimEnter",
   }
   use {
      "easymotion/vim-easymotion",
      event = "VimEnter",
   }
   use {
      "mbbill/undotree",
      event = "VimEnter",
   }
   use {
      "tomlion/vim-solidity",
      event = "VimEnter",
   }
   use {
      "psf/black",
   }
   use {
      "airblade/vim-rooter"
   }

end)

hooks.add("setup_mappings", function(map)
   map("n", "<leader>h", ":wincmd h<CR>")
   map("n", "<leader>j", ":wincmd j<CR>")
   map("n", "<leader>k", ":wincmd k<CR>")
   map("n", "<leader>l", ":wincmd l<CR>")
   map("n", "<leader>pv", ":wincmd v<CR>")
   map("n", "<C-j>", ":bp<CR>")
   map("n", "<C-k>", ":bn<CR>")
   map("n", "<silent> <leader>+", ":vertical resize +5<CR>")
   map("n", "<silent> <leader>-", ":vertical resize -5<CR>")
   map("n", "<leader>c", ":CommentToggle <CR>")
   map("v", "<leader>c", ":CommentToggle <CR>")
   map("n", "<C-p>", ":Telescope find_files hidden=true <CR>")
   map("n", "<leader>gc", ":Telescope git_commits <CR>")
   map("n", "<leader>gs", ":Telescope git_status <CR>")
   map("n", "<C-n>", ":nohl <CR>")
   map("t", "<C-e>", "<C-\\><C-n>")
   map("t", "<C-t>", "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>")
   map("n", "<leader>ht", ":Telescope terms <CR>")
   map("n", "<C-t>", ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>")
end)
