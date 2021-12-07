-- neovim status line configs
-- could be any of powerline, windline, lualine, airline or lightline

require('wlsample.airline')

--[[
local ft_extension = {
    sections = {lualine_a = {'filetype'}},
    filetypes = {'startify', 'Trouble', 'undotree', 'vim-plug'}
}

local neogit_extension = {
    sections = {lualine_a = {'branch'}},
    filetypes = {'NeogitStatus'}
}

require('lualine').setup({
  options = {
    component_separators = '',
    -- section_separators = { left = '', right = '' },
  },
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
    'quickfix',
    ft_extension,
    neogit_extension,
  }
})
]]
