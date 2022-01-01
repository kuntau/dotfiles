-- neovim status line configs
-- could be any of powerline, windline, lualine, airline or lightline

local ft_extension = {
    sections = {lualine_a = {'filetype'}},
    filetypes = {'startify', 'Trouble', 'undotree', 'DiffviewFiles', 'startuptime', 'packer'}
}

local help_extension = {
    sections = {lualine_a = {'filetype'}, lualine_c = {'filename'}},
    filetypes = {'help'}
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
  sections = {
    lualine_c = {{'filename', path=1}},
  },
  tabline = {
    lualine_a = {{'buffers', filetype_names=filetype_names}},
    lualine_z = {{'tabs', mode=0}},
  },
  extensions = {
    'nvim-tree',
    'quickfix',
    'symbols-outline',
    ft_extension,
    neogit_extension,
    help_extension,
  }
})
