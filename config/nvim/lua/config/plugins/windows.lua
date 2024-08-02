-- Windows management plugins

local animation = true

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
      -- buftype = { 'quickfix', 'nofile', 'terminal' },
      filetype = {
        'NvimTree',
        'DiffviewFiles',
        'undotree',
        'aerial',
        'Outline',
        'gitcommit',
      },
    },
    animation = {
      enable = animation, -- BROKEN: broke term, neogit
      duration = 150,
      easing = 'line',
    },
  })
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
      { 'anuvyklack/animation.nvim', enabled = animation },
    },
  }, -- Auto expand current window with animation
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  {
    'numToStr/Navigator.nvim',
    keys = {
      { '<c-l>', '<cmd>NavigatorRight<cr>',    mode = { 'n', 't' }, desc = 'Navigate right' },
      { '<c-h>', '<cmd>NavigatorLeft<cr>',     mode = { 'n', 't' }, desc = 'Navigate left' },
      { '<c-j>', '<cmd>NavigatorDown<cr>',     mode = { 'n', 't' }, desc = 'Navigate down' },
      { '<c-k>', '<cmd>NavigatorUp<cr>',       mode = { 'n', 't' }, desc = 'Navigate up' },
      { '<c-`>', '<cmd>NavigatorPrevious<cr>', mode = { 'n', 't' }, desc = 'Navigate previous' },
    },
    opts = { auto_save = 'current' },
  },
}
