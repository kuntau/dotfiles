-- Windows management plugins

local config_windows = function()
  local min_width = 5
  vim.o.winwidth = min_width
  vim.o.winminwidth = min_width
  vim.o.equalalways = false

  require('windows').setup({
    autowidth = {
      enable = true,
      winwidth = 0.4,
    },
    ignore = {
      -- buftype = { 'quickfix', 'nofile' },
      filetype = { 'NvimTree', 'DiffviewFiles', 'undotree', 'aerial', 'Outline' },
    },
    animation = {
      enable = true, -- BROKEN: broke term, neogit
      duration = 150,
      easing = 'line',
    },
  })
end

local config_tmux_navigator = function()
  vim.g.tmux_navigator_disable_when_zoomed = 0
  vim.g.tmux_navigator_preserve_zoom = 1
  vim.g_tmux_navigator_save_on_switch = 1 -- 1=up, 2=wall
  vim.g_tmux_navigator_no_mappings = 1 -- 1=up, 2=wall
end

return {
  {
    'anuvyklack/windows.nvim',
    event = 'WinNew',
    keys = {
      { '<C-w>z', '<cmd>WindowsMaximize<cr>', desc = 'Windows Maximize' },
      { '<C-w>_', '<cmd>WindowsMaximizeVertically<cr>', desc = 'Windows Maximize Vertically' },
      { '<C-w>|', '<cmd>WindowsMaximizeHorizontally<cr>', desc = 'Windows Maximize Horizontally' },
      { '<C-w>=', '<cmd>WindowsEqualize<cr>', desc = 'Windows Equalize' },
    },
    config = config_windows,
    dependencies = {
      'anuvyklack/middleclass',
      "anuvyklack/animation.nvim"
    },
  }, -- Auto expand current window with animation
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<c-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux navigate right' },
      { '<c-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux navigate left' },
      { '<c-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux navigate down' },
      { '<c-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux navigate up' },
      { '<c-`>', '<cmd>TmuxNavigatePrevious<cr>', desc = 'Tmux navigate previous' },
    },
    config = config_tmux_navigator,
  },
}
