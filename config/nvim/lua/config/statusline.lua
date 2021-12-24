-- neovim status line configs
-- could be any of powerline, windline, lualine, airline or lightline

local ft_extension = {
    sections = {lualine_a = {'filetype'}},
    filetypes = {'startify', 'Trouble', 'undotree', 'vim-plug', 'DiffviewFiles', 'startuptime'}
}

local neogit_extension = {
  sections = { lualine_a = {'filetype'}, lualine_b = {'branch'} },
  filetypes = {'NeogitStatus', 'NeogitCommitMessage', 'NeogitPopup', 'NeogitLogView', 'NeogitGitCommandHistory'}
}

require('lualine').setup({
  options = {
    component_separators = { left = '', right = '·'},
    disabled_filetypes = {},
  },
  tabline = {
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs  },
  },
  extensions = {
    'nvim-tree',
    'quickfix',
    'symbols-outline',
    ft_extension,
    neogit_extension,
  }
})
