return {
  'ojroques/nvim-osc52',
  event = 'VeryLazy',
  config = function()
    require('osc52').setup {
      max_length = 0,           -- No limit on selection size
      silent = false,            -- Show message on successful copy
      trim = false,              -- Don't trim surrounding whitespace
      tmux_passthrough = true,   -- Essential for tmux users
    }

    -- Set up clipboard provider using OSC52
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
      return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
    end

    vim.g.clipboard = {
      name = 'osc52',
      copy = {['+'] = copy, ['*'] = copy},
      paste = {['+'] = paste, ['*'] = paste},
    }

    -- Optional: Add keymappings for explicit OSC52 copy
    vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {
      expr = true,
      desc = 'Copy to clipboard (OSC52)'
    })
    vim.keymap.set('n', '<leader>yy', '<leader>y_', {
      remap = true,
      desc = 'Copy line to clipboard (OSC52)'
    })
    vim.keymap.set('v', '<leader>y', require('osc52').copy_visual, {
      desc = 'Copy selection to clipboard (OSC52)'
    })
  end,
}
