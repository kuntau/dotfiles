-- All colorschemes should be here.

return {
  'folke/tokyonight.nvim',
  'nyoom-engineering/oxocarbon.nvim', -- IBM carbon inspired
  'NTBBloodbath/doom-one.nvim',
  { 'rebelot/kanagawa.nvim', opts = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox
  { 'sainnhe/everforest', init = function() vim.g.everforest_better_performance = 1 vim.g.everforest_background = 'hard' end },
  { 'sainnhe/gruvbox-material', init = function() vim.g.gruvbox_material_better_performance = 1 vim.g.gruvbox_material_background = 'hard' end },
  { 'sainnhe/sonokai', init = function() vim.g.sonokai_better_performance = 1 vim.g.sonokai_style = 'andromeda' end },
  { 'sainnhe/edge', init = function() vim.g.edge_better_performance = 1 vim.g.edge_style = 'neon' end },
  {
    'NLKNguyen/papercolor-theme',
    init = function()
      vim.g.PaperColor_Theme_Options = {
        theme = {
          default = {
            allow_italic = 1,
            allow_bold = 1,
            transparent_background = 0,
          },
        },
      }
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    opts = {
      theme = 'nordic',
      bold_keywords = true,
      transparent = { bg = false },
      noice = { style = 'flat' },
      telescope = { style = 'flat' },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    opts = {
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
          aerial         = true,
          blink          = true,
          dap_ui         = true,
          diagnostic     = true,
          gitsigns       = true,
          lightspeed     = true,
          modes          = true,
          native_lsp     = true,
          neogit         = true,
          notify         = true,
          nvimtree       = true,
          symbol_outline = true,
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
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      auto_integrations = true,
      flavour = 'macchiato',
      term_colors = true,
      background = {
        light = 'latte',
        dark  = 'macchiato',
      },
      dim_inactive = {
        enabled     = false,
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
        aerial               = true,
        blink_cmp            = {
          style = 'bordered',
        },
        dashboard            = true,
        diffview             = true,
        gitsigns             = true,
        leap                 = true,
        lsp_trouble          = true,
        markdown             = true,
        mason                = true,
        noice                = true,
        nvim_surround        = true,
        snacks               = {
          enabled = false,
          indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        symbols_outline      = true,
        treesitter           = true,
        treesitter_context   = true,
        ts_rainbow2          = true,
        ufo                  = true,
        which_key            = true,
      },
      -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
      dap = {
        enabled   = true,
        enable_ui = true,
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
    },
  },
  {
    'marko-cerovac/material.nvim',
    init = function()
      vim.g.material_style = 'darker' -- oceanic|palenight|darker|lighter|deep ocean
    end,
    opts = {
      contrast = {
        sidebars = true,
        floating_windows = false,
        cursor_line = true,
        popup_menu = false,
        filetypes = {
          "qf",
          "packer",
          "dapui_breakpoints",
        }
      },
      styles = {
        comments = { italic = true },
        functions = { bold = true, italic = true },
        keywords = { bold = true },
      },
      disable = {
        borders = true,
        background = false,
        term_colors = false,
        eob_lines = false
      },
      -- lualine_style = 'stealth',
      plugins = {
        'dap',
        'gitsigns',
        'mini',
        'neogit',
        'nvim-cmp',
        'nvim-web-devicons',
        'nvim-tree',
        'telescope',
        'trouble',
        'which-key',
      },
    },
  },
}
