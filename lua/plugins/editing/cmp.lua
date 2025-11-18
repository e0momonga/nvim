return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort() -- 候補を閉じる
        end
        fallback() -- 改行
      end),
      ["<C-CR>"] = cmp.mapping.confirm { select = true }, -- Ctrl+Enterで確定
      ["<Tab>"] = cmp.mapping.select_next_item(), -- 次の候補
      ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- 前の候補
    })
    return opts
  end,
}
