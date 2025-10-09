-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "html", "cssls", "clangd", "rust_analyzer", "gopls", "ruby_lsp", "terraformls", "ts_ls", "marksman" }

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- dart
-- require("lspconfig").dartls.setup({
--   cmd = { "dart", "language-server", "--protocol=lsp" },
--   filetypes = { "dart" },
--   init_options = {
--     closingLabels = true,
--     flutterOutline = true,
--     onlyAnalyzeProjectsWithOpenFiles = true,
--     outline = true,
--     suggestFromUnimportedLibraries = true,
--   },
--   settings = {
--     dart = {
--       completeFunctionCalls = true,
--       showTodos = true,
--     },
--   },
--   on_attach = function(client, bufnr)
--   end,
-- })
