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
      comments    = { "italic" },
      conditional = { "italic" },
      functions   = { 'bold', "italic" },
      keywords    = { "bold" },
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
        errors      = { "italic" },
        hints       = { "italic" },
        warnings    = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors      = { "underline" },
        hints       = { "underline" },
        warnings    = { "underline" },
        information = { "underline" },
      },
    },
  })
end

local config_nightfox = function()
  local nf = require("nightfox")

  nf.setup({
    options = {
      dim_inactive    = true, -- Non current window bg to alt color see `hl-NormalNC`
      terminal_colors = true, -- Configure the colors used when opening :terminal
      styles = {
        comments  = "italic", -- Style that is applied to comments: see `highlight-args` for options
        functions = "bold,italic", -- Style that is applied to functions: see `highlight-args` for options
        keywords  = "bold", -- Style that is applied to keywords: see `highlight-args` for options
        -- strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
        -- variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
      },
      inverse = {
        match_paren = false, -- Enable/Disable inverse highlighting for match parens
        visual = true, -- Enable/Disable inverse highlighting for visual selection
        search = true, -- Enable/Disable inverse highlights for search highlights
      },
      -- colors = {}, -- Override default colors
      -- hlgroups = {}, -- Override highlight groups
    }
  })

  nf.load()
end

local config_material = function()

  vim.g.material_style = "oceanic" -- oceanic|palenight|darker|lighter|deep ocean

  require('material').setup({
    contrast = {
      sidebar = true,
      filetypes = {
        "qf",
        "lazy",
        "dapui_breakpoints",
      }
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
      'mini',
      'neogit',
      'nvim-cmp',
      'nvim-navic',
      'nvim-web-devicons',
      'nvim-tree',
      'telescope',
      'trouble',
      'which-key',
    }
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
  { 'rakr/vim-one', config = function() vim.g.one_allow_italics = 1 end },
  { 'EdenEast/nightfox.nvim', config = config_nightfox },
  { 'NTBBloodbath/doom-one.nvim', config = true },
  { 'catppuccin/nvim', name = 'catppuccin', config = config_catpuccin },
  { 'kuntau/ayu-vim', branch = 'italic', config = config_ayu },
  { 'marko-cerovac/material.nvim', config = config_material },
  { 'rebelot/kanagawa.nvim', config = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox
  { 'sainnhe/everforest', config = function() vim.g.everforest_background = 'hard' end },
}
