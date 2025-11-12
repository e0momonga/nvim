-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "html", "cssls", "clangd", "rust_analyzer", "gopls", "ruby_lsp", "terraformls", "ts_ls", "biome", "marksman" }

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
