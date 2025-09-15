require "nvchad.mappings"
local map = vim.keymap.set


-- general
map("i", "jj", "<ESC>")
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit Nvchad" })
map("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })
map("n", "]b", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "[b", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>bx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all buffers except current one" })

map("n", "<leader>rh", function() require("highlights").setup() end, { desc = "Reload Highlights" })

-- 黒穴レジスタで通常モードの削除（ヤンクせずに削除）
vim.keymap.set('n', '<leader>d', '"_d', { noremap = true, desc = "Delete without yanking" })

-- ビジュアルモードでも同様に削除
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true, desc = "Visual delete without yanking" })

-- 行全体を黒穴レジスタで削除
vim.keymap.set('n', '<leader>dd', '"_dd', { noremap = true, desc = "Line delete without yanking" })


-- Movement enhancements
map("n", "<S-l>", "$")
map("n", "<S-h>", "^")


-- lazy plugin manager
map("n", "<leader>pi", function() require("lazy").install() end, { desc = "Install Plugin" })


-- mason installer
map("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Open Mason Installer" })

-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- lazydocker
map("n", "<leader>ld", "<cmd>Lazydocker<CR>", { desc = "LazyDocker" })


-- LSP
-- This overrids default mappings of Nvchad in theory.
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua
-- However, it seems default mappings are not working, so I will keep this.
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true, desc = "Show hover" })
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = "Jump to definition" })
map('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>',
  { noremap = true, silent = true, desc = "Open code actions" })
map('x', '<leader>ca', '<Cmd>lua vim.lsp.buf.range_code_action()<CR>',
  { noremap = true, silent = true, desc = "Open code actions for selected range" })



-- diffview
map("n", "<leader>gdo", function()
  require("highlights").setup() -- Highlight refresh is required
  vim.cmd("DiffviewOpen")
end, { desc = "DiffviewOpen" })
map("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose" })
map("n", "<leader>gdb", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview on current branch" })
map("n", "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview on current file" })

-- git-conflict.nvim
map("n", "<leader>gc", "<cmd>GitConflictListQf<CR>", { desc = "ListGitConflict" })

-- neotest
map("n", "<leader>nr", "<Cmd>lua require('neotest').run.run()<CR>", { desc = "Run the nearest test" })
map("n", "<leader>nf", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run the tests of current file" })
map("n", "<leader>nR", "<Cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run all tests" })
map("n", "<leader>nS", "<Cmd>lua require('neotest').stop()<CR>", { desc = "Stop the tests" })
map("n", "<leader>no", "<Cmd>lua require('neotest').output.open({ enter = true })<CR>", { desc = "Open output" })
map("n", "<leader>ns", "<Cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Open summary" })


-- RSpec commands
map("n", "<leader>rn", ":RSpecNearest<CR>", { desc = "Run nearest spec", silent = true })
map("n", "<leader>rf", ":RSpecCurrentFile<CR>", { desc = "Run current file spec", silent = true })
map("n", "<leader>rr", ":RSpecRerun<CR>", { desc = "Rerun spec", silent = true })
map("n", "<leader>rF", ":RSpecOnlyFailures<CR>", { desc = "Run only failed spec", silent = true })
map("n", "<leader>rs", ":RSpecShowLastResult<CR>", { desc = "Show spec results", silent = true })

-- Flutter
map("n", "<leader>rl", ":FlutterLspRestart<CR>", { desc = "Restart Flutter LSP" })

-- dial.nvim
map("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end, { desc = "Increment number under cursor" })

map("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end, { desc = "Decrement number under cursor" })

map("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end, { desc = "Increment number under visual" })

map("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end, { desc = "Decrement number under visual" })

-- treesj
map("n", "<leader>mt", "<cmd>lua require('treesj').toggle()<CR>", { desc = "Toggle Treesj" })

-- dap key maps
map("n", "<F5>", ":lua require'dap'.continue()<CR>",
  { silent = true, desc = "Continue debugging or start if not started" })
map("n", "<F9>", ":lua require'dap'.step_into()<CR>", { silent = true, desc = "Step into the function call" })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true, desc = "Step over the current line of code" })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true, desc = "Step out of the current function" })

map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>",
  { silent = true, desc = "Toggle breakpoint at the current line" })
map("n", "<leader>bu", ":lua require'dap'.clear_breakpoints()<CR>", { silent = true, desc = "Clear all breakpoints" })
map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { silent = true, desc = "Set a breakpoint with a condition" })
map("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { silent = true, desc = "Set a log point" })

-- dap-ui key maps
map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true, desc = "Toggle dap-ui" })

-- Copilot
map("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
map("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
map("i", "<C-k>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true, replace_keycodes = false })

-- ZenMode
map("n", "<leader>zz", ":ZenMode<CR>", { desc = "ZenMode" })

-- Paste without yanking in visual mode
map("x", "p", '"_dP', { desc = "Paste without yanking", silent = true })

-- copy-file-path.nvim
map("n", "<leader>cp", ":CopyFilePath<CR>", { desc = "Copy file path", silent = true })

-- Telescope shortcuts (quick access) with resume support
local builtin = require("telescope.builtin")
map("n", "fb", telescope_utils.smart_resume("buffers", builtin.buffers), { desc = "Find buffers" })
map("n", "ff", telescope_utils.smart_resume("find_files", builtin.find_files), { desc = "Find files" })
map("n", "fw", telescope_utils.smart_resume("live_grep", builtin.live_grep), { desc = "Find words" })
map("n", "<leader>fb", telescope_utils.smart_resume("buffers", builtin.buffers), { desc = "Find buffers" })
map("n", "<leader>ff", telescope_utils.smart_resume("find_files", builtin.find_files), { desc = "Find files" })
map("n", "<leader>fw", telescope_utils.smart_resume("live_grep", builtin.live_grep), { desc = "Find words" })

-- Disable default leader+n mapping and add custom line number toggle
vim.keymap.del("n", "<leader>n", { silent = true })
map("n", "<leader>NN", function()
  vim.wo.number = not vim.wo.number
end, { desc = "Toggle line numbers" })

