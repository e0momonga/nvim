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
      -- layout config
      layout_strategy = "vertical", -- vertical layout for bottom preview
      layout_config = {
        vertical = {
          prompt_position = "top", -- 検索窓を上部に配置
          mirror = true, -- プレビューを下側に配置
          width = { padding = 0 },
          height = { padding = 0 },
          preview_height = 0.4, -- 下側40%をプレビューに
        },
      },
      sorting_strategy = "ascending", -- 結果の並び順を上からにする
      -- Enable picker caching for resume functionality
      cache_picker = {
        num_pickers = 10, -- キャッシュするpicker数
        limit_entries = 1000, -- エントリ数制限
      },
      -- Smart history configuration
      history = {
        path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
        limit = 100,
      },
      -- History navigation mappings
      mappings = {
        i = {
          ["<M-k>"] = require("telescope.actions").cycle_history_prev,
          ["<M-j>"] = require("telescope.actions").cycle_history_next,
          -- 検索結果をquickfixリストに送信（n/Nでファイル間移動可能）
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        },
        n = {
          -- 検索結果をquickfixリストに送信（n/Nでファイル間移動可能）
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        },
      },
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
  -- live_grep_args拡張をロード
  require("telescope").load_extension "live_grep_args"
end

-- Telescope utility functions
local M = {}

local telescope_used = {}

M.smart_resume = function(picker_name, builtin_func)
  return function()
    if telescope_used[picker_name] then
      -- 2回目以降はresume
      require("telescope.builtin").resume()
    else
      -- 初回は通常検索
      telescope_used[picker_name] = true
      builtin_func()
    end
  end
end

-- fzfを使わない正確なファイル検索
-- fuzzy matchではなくsubstring matchで厳密にマッチング
M.find_files_exact = function()
  require("telescope.builtin").find_files {
    file_sorter = require("telescope.sorters").get_substr_matcher(),
  }
end

-- Export utilities for use in mappings
_G.telescope_utils = M

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = setup,
}
