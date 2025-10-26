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
    lsp = { "ts_ls", "biome" },
    formatters = { "biome" },
    linters = { "biome" },
  },

  -- Go
  go = {
    lsp = { "gopls" },
    formatters = { "goimports" },
    linters = { "golangci-lint" },
  },

  -- Python
  python = {
    lsp = { "pyright" },
    formatters = { "ruff" },
    linters = { "ruff" },
  },

  -- Rust
  rust = {
    lsp = { "rust_analyzer" },
    formatters = { "rustfmt" },
  },

  -- Ruby
  ruby = {
    lsp = { "ruby_lsp" },
  },

  -- Terraform/IaC
  terraform = {
    lsp = { "terraformls" },
    linters = { "tflint" },
  },

  -- AWS/CloudFormation
  aws = {
    linters = { "cfn-lint" },
  },

  -- Shell Script
  shell = {
    linters = { "shellcheck" },
    formatters = { "shfmt" },
  },

  -- Docker
  docker = {
    linters = { "hadolint" },
  },

  -- GitHub Actions
  github = {
    linters = { "actionlint" },
  },

  -- 共通ツール（言語非依存）
  common = {
    lsp = {
      "marksman",  -- Markdown
      "taplo",     -- TOML
      "jsonls",    -- JSON
      "yamlls",    -- YAML
    },
  },
}
