-- for file or text search

local function setup()
  require("telescope").setup {
    defaults = {
      file_ignore_patterns = {
        "^.git/",
        "^.cache/",
        "^Library/",
        "Parallels",
        "^Movies",
        "^Music",
        "node_modules/",
        "vendor/",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "-uu",
      },
      -- layout confing
      layout_strategy = "horizontal", -- または "vertical" も可
      layout_config = {
        prompt_position = "top", -- 検索窓を上部に配置
        anchor = "N", -- "N" は North (上)
      },
      sorting_strategy = "ascending", -- 結果の並び順を上からにする
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  -- fzf拡張をロード
  require("telescope").load_extension "fzf"

  -- local builtin = require('telescope.builtin')
  -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  config = setup,
}
