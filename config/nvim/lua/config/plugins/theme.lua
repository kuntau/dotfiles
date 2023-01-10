-- All colorschemes should be here.

local config_catpuccin = function()
  require('catppuccin').setup({
    flavour = 'macchiato',
    term_colors = true,
    background = {
      light = 'latte',
      dark  = 'macchiato',
    },
    dim_inactive = {
      enabled     = true,
      shade       = 'dark',
      perccentage = 0.15,
    },
    styles = {
      comments    = { 'italic' },
      conditional = { 'italic' },
      functions   = { 'bold', 'italic' },
      keywords    = { 'bold' },
      strings     = {},
      variables   = {},
    },
    integrations = {
      cmp                = true,
      gitsigns           = true,
      leap               = true,
      lsp_trouble        = true,
      markdown           = true,
      mason              = true,
      noice              = true,
      notify             = true,
      nvimtree           = true,
      symbols_outline    = true,
      telescope          = true,
      treesitter         = true,
      treesitter_context = true,
      ts_rainbow         = true,
      which_key          = true,
    },
    -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
    dap = {
      enabled   = true,
      enable_ui = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors      = { 'italic' },
        hints       = { 'italic' },
        warnings    = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors      = { 'underline' },
        hints       = { 'underline' },
        warnings    = { 'underline' },
        information = { 'underline' },
      },
    },
  })
end

local config_nightfox = function()
  require('nightfox').setup({
    options = {
      dim_inactive = false, -- Non current window bg to alt color see `hl-NormalNC`
      terminal_colors = true, -- Configure the colors used when opening :terminal
      styles = {
        comments  = 'italic',
        functions = 'bold,italic',
        keywords  = 'bold',
        strings   = 'NONE',
        variables = 'NONE',
      },
      inverse = {
        match_paren = false, -- Enable/Disable inverse highlighting for match parens
        visual      = true, -- Enable/Disable inverse highlighting for visual selection
        search      = true, -- Enable/Disable inverse highlights for search highlights
      },
      module_default = false,
      modules = {
        cmp            = true,
        dap_ui         = true,
        diagnostic     = true,
        gitsigns       = true,
        lightspeed     = true,
        modes          = true,
        native_lsp     = true,
        navic          = true,
        neogit         = true,
        notify         = true,
        nvimtree       = true,
        symbol_outline = true,
        telescope      = true,
        treesitter     = true,
        tsrainbow      = true,
        whichkey       = true,
      },
      specs = { all = { syntax = { operator = 'orange' } } },
      groups = {
        all = {
          TelescopeBorder = { fg = 'bg4' },
          TelescopeTitle = { fg = 'fg2', bg = 'bg4' },

          CmpItemKindFunction = { fg = 'palette.pink' },
          CmpItemKindMethod = { fg = 'palette.pink' },
          CmpWindowBorder = { fg = 'bg0', bg = 'bg0' },
        },
      },
      -- colors = {}, -- Override default colors
      -- hlgroups = {}, -- Override highlight groups
    },
  })

  -- nf.load()
end

local config_material = function()
  vim.g.material_style = 'darker' -- oceanic|palenight|darker|lighter|deep ocean

  require('material').setup({
    contrast = {
      sidebar = true,
      filetypes = {
        'qf',
        'lazy',
        'dapui_breakpoints',
      },
    },
    styles = {
      comments = { italic = true },
      functions = { bold = true, italic = true },
      keywords = { bold = true },
    },
    -- lualine_style = 'stealth',
    plugins = {
      'dap',
      'gitsigns',
      'indent-blankline',
      'leap',
      'mini',
      'neogit',
      'nvim-cmp',
      'nvim-navic',
      'nvim-web-devicons',
      'nvim-tree',
      'telescope',
      'trouble',
      'which-key',
    },
  })
end

local config_ayu = function()
  vim.g.ayu_comment_italic = 1

  local is_day = require('utils').isDay()

  if is_day then
    vim.g.ayucolor = 'light'
  else
    vim.g.ayucolor = 'mirage'
  end
end

return {
  -- Colorschemes
  'NLKNguyen/papercolor-theme',
  'arcticicestudio/nord-vim',
  'folke/tokyonight.nvim',
  'nyoom-engineering/oxocarbon.nvim', -- IBM carbon inspired
  'NTBBloodbath/doom-one.nvim',
  { 'rakr/vim-one', config = function() vim.g.one_allow_italics = 1 end },
  { 'EdenEast/nightfox.nvim', config = config_nightfox },
  { 'catppuccin/nvim', name = 'catppuccin', config = config_catpuccin },
  { 'kuntau/ayu-vim', branch = 'italic', config = config_ayu },
  { 'marko-cerovac/material.nvim', config = config_material, dev = true },
  { 'rebelot/kanagawa.nvim', config = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox
  { 'sainnhe/everforest', config = function() vim.g.everforest_background = 'hard' end },
}
