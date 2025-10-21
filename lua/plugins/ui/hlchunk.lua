-- インデントとコードブロックの視覚化
return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = { enable = true }, -- コードブロックのハイライト
      indent = { enable = true }, -- インデントガイド
      line_num = { enable = false }, -- 行番号ハイライト（無効）
      blank = { enable = false }, -- 空行ハイライト（無効）
    })
  end,
}
