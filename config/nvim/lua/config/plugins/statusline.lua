-- StatusLine, bufferline & tabline configs
-- could be any of powerline, windline, lualine, airline or lightline

-- stylua: ignore
local filetype_names = {
  DiffviewFiles = 'Diff View',
  NeogitStatus  = 'Neogit',
  NvimTree      = 'Nvim Tree',
  Outline       = 'Symbols Outline',
  aerial        = 'Aerial',
  gitcommit     = 'Git Commit',
  startify      = 'Startify',
  startuptime   = 'Startup Time',
  undotree      = 'Undo Tree',
}

local ft_upper = {
  'filetype',
  fmt = function(name)
    return filetype_names[name] and filetype_names[name] or name
  end,
}

local ft_extension = {
  sections = { lualine_a = { ft_upper } },
  filetypes = {
    'DiffviewFiles',
    'NvimTree',
    'Outline',
    'Trouble',
    'aerial',
    'startify',
    'startuptime',
    'undotree',
  },
}

local help_extension = {
  sections = { lualine_a = { ft_upper }, lualine_c = { 'filename' }, lualine_z = { 'progress' } },
  filetypes = { 'help', 'man' },
}

local neogit_extension = {
  sections = { lualine_a = { ft_upper }, lualine_b = { 'branch' } },
  filetypes = {
    'gitcommit',
    'NeogitStatus',
    'NeogitCommitMessage',
    'NeogitPopup',
    'NeogitLogView',
    'NeogitGitCommandHistory',
  },
}

-- Lsp server name .
local active_lsp = {
  function()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        if client.name == 'null-ls' then
          msg = client.name
        else
          return client.name
        end
      end
    end
    return msg
  end,
  icon = ' LSP:',
}

local diff_source = function()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

-- eviline configs
local evil_opts = function()
  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
  }

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Inserts a component in lualine_c at left section
  local ins_left = function(component) table.insert(config.sections.lualine_c, component) end

  -- Inserts a component in lualine_x ot right section
  local ins_right = function(component) table.insert(config.sections.lualine_x, component) end

  ins_left({
    function() return '▊' end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  })

  ins_left({
    -- mode component
    function() return '' end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  })

  ins_left({
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
  })

  ins_left({
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
  })

  ins_left({ 'location' })

  ins_left({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

  ins_left({
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  })

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left({
    function() return '%=' end,
  })

  ins_left(active_lsp)

  -- Add components to right sections
  ins_right({
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
  })

  ins_right({
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
  })

  ins_right({
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
  })

  ins_right({
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  })

  ins_right({
    function() return '▊' end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }) -- code

  return config
end

-- my custom configs
local norm_opts = {
  options = {
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'startify' },
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'tabs',
        mode = 0,
        cond = function() return vim.fn.tabpagenr('$') > 1 and true or false end,
        separator = { left = '', right = ''},
      },
      'mode',
    },
    lualine_b = {
      { 'b:gitsigns_head', icon = '' },
      { 'diff', source = diff_source },
      { 'diagnostics', symbols = { error = ' ', warn = ' ', hint = ' ', info = ' ' } },
    },
    lualine_c = {
      { 'filename', path = 1 },
      { 'aerial' }
    },
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
      },
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
      },
      {
        require("noice").api.status.search.get,
        cond = require("noice").api.status.search.has,
      },
      {
        'fileformat',
        separator = '',
      },
      {
        'filetype',
        colored = false,
        icon_only = true,
        separator = '',
        -- fmt = string.upper,
      },
      {
        'encoding',
        fmt = string.upper
      },
    },
    lualine_y = { 'location', 'progress' },
    lualine_z = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
      },
      active_lsp,
    }
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 1 } },
  },
  extensions = {
    -- 'aerial',
    -- 'nvim-tree',
    'nvim-dap-ui',
    'quickfix',
    -- 'symbols-outline',
    ft_extension,
    neogit_extension,
    help_extension,
  }
}

return {
  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', opts = norm_opts, config = function(_, opts) require('lualine').setup(opts) end },
  { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' }, -- Tmux statusline
}
