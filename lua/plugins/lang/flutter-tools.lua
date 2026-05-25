return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local map = vim.keymap.set
      map("n", "<leader>Fr", "<Cmd>FlutterRun<CR>", { desc = "Flutter Run" })
      map("n", "<leader>Fq", "<Cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
      map("n", "<leader>FR", "<Cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
      map("n", "<leader>Fl", function()
        vim.cmd("FlutterLogClear")
        vim.cmd("FlutterReload")
      end, { desc = "Flutter Hot Reload" })
      map("n", "<leader>Fd", "<Cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
      map("n", "<leader>Fe", "<Cmd>FlutterEmulators<CR>", { desc = "Flutter Emulators" })
      map("n", "<leader>Fo", "<Cmd>FlutterOutlineToggle<CR>", { desc = "Flutter Outline Toggle" })
      map("n", "<leader>FL", "<Cmd>FlutterLspRestart<CR>", { desc = "Flutter LSP Restart" })

      require("flutter-tools").setup {
        flutter_lookup_cmd = "mise where flutter",
        fvm = false,
        root_patterns = { ".git", "pubspec.yaml" },
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          enabled = true,
          highlight = "Comment",
          prefix = "// ",
        },
        lsp = {
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
        debugger = {
          enabled = false,
        },
      }
    end,
  },
}
