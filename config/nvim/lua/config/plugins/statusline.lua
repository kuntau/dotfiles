-- StatusLine, bufferline & tabline configs
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

local filetype_names = {
  packer = 'Packer',
  undotree = 'Undo Tree',
  NeogitStatus = 'Neogit',
  startuptime = 'Startup Time',
  Outline = 'Symbols Outline',
  startify = 'Startify',
  DiffviewFiles = 'Diff View',
}

local config = function()

  require('lualine').setup({
    options = {
      component_separators = { left = '', right = '·'},
      disabled_filetypes = {},
      always_divide_middle = false,
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        {'filename', path = 1},
        { require("nvim-navic").get_location, cond = require("nvim-navic").is_available }
      },
      lualine_b = {'diff', 'diagnostics'},
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.search.get,
          cond = require("noice").api.status.search.has,
          color = { fg = "#ff9e64" },
        },
        'encoding', 'fileformat', 'filetype',
      },
    },
    inactive_sections = {
      lualine_c = {{'filename', path=1}},
    },
    tabline = {
      lualine_a = {{'buffers', filetype_names=filetype_names}},
      lualine_z = {{'tabs', mode=0}},
      lualine_y = {'branch'},
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
end

return {
  { 'nvim-lualine/lualine.nvim', event = 'BufReadPost', config = config },
  { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' }, -- Tmux statusline
}
