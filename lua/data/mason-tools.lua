-- Mason で管理するツールのリスト
-- 言語ごとに LSP、フォーマッター、リンター等を整理

return {
  -- Lua
  lua = {
    lsp = { "lua_ls" },
    formatters = { "stylua" },
  },

  -- TypeScript/JavaScript
  typescript = {
    lsp = { "typescript-language-server", "biome", "eslint-lsp" },
    formatters = { "biome" },
    linters = { "biome" },
  },

  -- Go
  go = {
    lsp = { "gopls" },
    formatters = { "goimports" },
  },

  -- Python
  python = {
    lsp = { "pyright" },
    formatters = { "ruff" },
    linters = { "ruff" },
  },

  -- Rust
  rust = {
    lsp = { "rust-analyzer" },
    formatters = { "rustfmt" },
  },

  -- Ruby
  ruby = {
    lsp = { "ruby_lsp" },
  },

  -- Terraform/IaC
  terraform = {
    lsp = { "terraform-ls" },
    formatters = { "terraform" },
    linters = { "tflint" },
  },

  -- AWS/CloudFormation
  aws = {
    linters = { "cfn-lint" },
  },

  -- 共通ツール（言語非依存）
  common = {
    -- lsp = { "marksman", "taplo" },
  },
}
