local function toggle_theme(themes)
   local current_theme = vim.g.current_nvchad_theme or vim.g.nvchad_theme
   for _, name in ipairs(themes) do
      if name ~= current_theme then
         if require("nvchad").reload_theme(name) then
            -- open a buffer and close it to reload the statusline
            vim.cmd "new|bwipeout"
            vim.g.current_nvchad_theme = name
            if require("nvchad").change_theme(vim.g.nvchad_theme, name) then
               vim.g.nvchad_theme = name
            end
         end
      end
   end
end

return toggle_theme
