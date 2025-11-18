return {
   {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Get the Neovim server address and pass it to lazygit
      vim.g.lazygit_floating_window_use_plenary = 0

      -- Set NVIM environment variable for child processes
      local nvim_server = vim.v.servername
      if nvim_server then
        vim.env.NVIM = nvim_server
      end
    end,
  },
}
