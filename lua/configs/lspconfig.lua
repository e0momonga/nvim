-- ========================================
-- LSP サーバー管理
-- ========================================
--
-- LSP サーバーは mason-lspconfig.nvim (lua/plugins/mason.lua) で自動管理されています。
-- 新しい LSP を追加する場合は lua/data/mason-tools.lua を編集してください。
--

-- mason-lspconfig に完全に任せるため、空リストに設定
local servers = {}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- ruby-lsp: Bundler を無効化して Mason のものを使用
-- NvChad の defaults() の後に実行されるため、ここで設定すれば確実に反映される
vim.lsp.config("ruby_lsp", {
  cmd = {
    "env",
    "BUNDLE_GEMFILE=",
    vim.fn.stdpath("data") .. "/mason/bin/ruby-lsp",
  },
})
