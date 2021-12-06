-- neovim status line configs
-- could be any of lualine, airline or lightline

require('lualine').setup({
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    'nvim-tree',
    'neogit',
    'trouble',
    'vim-plug',
    'undotree',
    'quickfix'
  }
})

