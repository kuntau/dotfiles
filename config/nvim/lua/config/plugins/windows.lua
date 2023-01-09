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
      enable = false, -- BROKEN: broke term, neogit
      duration = 150,
    }
  })
end

local config_tmux_navigator = function()
  vim.g.tmux_navigator_disable_when_zoomed = 0
  vim.g.tmux_navigator_preserve_zoom = 1
  vim.g_tmux_navigator_save_on_switch = 1 -- 1=up, 2=wall
  vim.g_tmux_navigator_no_mappings = 1 -- 1=up, 2=wall
end

return {
  { 'anuvyklack/windows.nvim',
    event = 'WinNew',
    config = config_windows,
    dependencies = {
      "anuvyklack/middleclass",
      -- "anuvyklack/animation.nvim"
    },
  }, -- Auto expand current window with animation
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  { 'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateRight',
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigatePrevious',
    },
    config = config_tmux_navigator,
  },
}
