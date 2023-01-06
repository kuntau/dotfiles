-- Windows management plugins

local config_windows = function()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require('windows').setup({
    autowidth = {
      enable = true,
      winwidth = .4,
    },
    ignore = {
      -- buftype = { 'quickfix', 'nofile' },
      filetype = { 'NvimTree', 'DiffviewFiles', 'undotree', 'gundo', 'Outline' }
    },
    animation = {
      enable = true,
      duration = 150,
    }
  })
end

local config_tmux = function()
  vim.g.tmux_navigator_disable_when_zoomed = 1
end

return {
  { 'anuvyklack/windows.nvim',
    event = 'WinNew',
    config = config_windows,
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
  }, -- Auto expand current window with animation
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  { 'christoomey/vim-tmux-navigator',
    keys = { '<c-k>', '<c-j>', '<c-h>', '<c-l>' },
    config = config_tmux,
  },
}
