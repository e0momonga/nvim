local cmp = require "cmp"

-- NvChad のデフォルト設定を取得
local nvchad_cmp = require "nvchad.configs.cmp"

-- Enter キーのマッピングのみ上書き
local custom_mapping = {
  ["<CR>"] = cmp.mapping(function(fallback)
    fallback() -- 常に改行
  end),
  
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      -- 手動で選択された項目のみ確定、自動選択は無効
      if cmp.get_active_entry() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      else
        fallback()
      end
    elseif require("luasnip").expand_or_jumpable() then
      require("luasnip").expand_or_jump()
    else
      fallback()
    end
  end, { "i", "s" }),
}

-- デフォルト設定のマッピングとマージ
local merged_options = vim.tbl_deep_extend("force", nvchad_cmp, {
  mapping = vim.tbl_deep_extend("force", nvchad_cmp.mapping or {}, custom_mapping)
})

return merged_options