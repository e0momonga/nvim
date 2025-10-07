local M = {}

-- Colorscheme selection
M.colorscheme = "monokai-pro"

-- Colorscheme definitions
-- To add a new colorscheme, just add an entry here
M.schemes = {
  ["onedark"] = {
    plugin = "navarasu/onedark.nvim",
    setup = function()
      require("onedark").setup({
        transparent = true,
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  ["monokai-pro"] = {
    plugin = "loctvl842/monokai-pro.nvim",
    setup = function()
      require("monokai-pro").setup({
        transparent_background = true,
      })
      vim.cmd("colorscheme monokai-pro")
    end,
  },
}

-- Auto-generate plugins list from schemes
-- This avoids duplicating plugin names in multiple files
M.plugins = {}
for _, scheme in pairs(M.schemes) do
  table.insert(M.plugins, { scheme.plugin, lazy = false })
end

return M
