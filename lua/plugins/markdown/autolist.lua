return {
  "gaoDean/autolist.nvim",
  ft = { "markdown", "text" },
  config = function()
    require("autolist").setup()

    vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>", { buffer = true })
    vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", { buffer = true })
    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", { buffer = true })
    vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>", { buffer = true })
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", { buffer = true })
    vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", { buffer = true })
    vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>", { buffer = true })

    -- Cycle list types with <leader>cn and <leader>cp
    vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true, buffer = true })
    vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true, buffer = true })
  end,
}
