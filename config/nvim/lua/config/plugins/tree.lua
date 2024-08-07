-- nvim-tree configs

local config = function()
  require('nvim-tree').setup({
    open_on_tab = true,
    update_cwd = true,
    reload_on_bufenter = true,
    hijack_cursor = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    filters = {
      dotfiles = true,
      custom = { 'node_modules' }
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {
        'help',
        'startify',
        'NeogitStatus',
      }
    },
    git = {
      enable = false,
      ignore = true,
      timeout = 500,
    },
    trash = {
      cmd = 'trash',
      require_confirm = true
    }
  }) -- nvim-tree
end

return {
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = config,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
  }
}
