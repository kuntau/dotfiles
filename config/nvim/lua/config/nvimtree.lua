-- nvim-tree configs

require('nvim-tree').setup({
  open_on_setup = true,
  open_on_tab = true,
  update_cwd = true,
  hijack_cursor = true,
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { 'startify', 'help' },
  update_to_buf_dir = {
    enable = false,
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
