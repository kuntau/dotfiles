-- diff configs

local opts_diffview = {
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    view = {
      { 'n', 'q', function() require('diffview.config').actions.close() end, { desc = 'Close Diffview' } },
    },
    file_panel = {
      { 'n', 'q', function() vim.cmd('DiffviewClose') end, { desc = 'Close Diffview' } },
      { 'n', '<esc>', function() require('diffview.config').actions.close() end, { desc = 'Close file panel' } },
    },
    file_history_panel = {
      { 'n', 'q', function() vim.cmd('DiffviewClose') end, { desc = 'Close Diffview' } },
    },
  },
}

return {
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
    opts = opts_diffview,
  },
  {
    "esmuellert/vscode-diff.nvim",
    branch = 'next',
    cmd = "CodeDiff",
  }
}
