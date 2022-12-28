-- All colorschemes should be here.

local config_catpuccin = function()
  require('catppuccin').setup({
    term_colors = true,
    styles = {
      comments = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
    },
    integrations = {
      lightspeed  = true,
      lsp_trouble = true,
      neogit      = true,
      ts_rainbow  = true,
    }
  })
end

local config_nightfox = function()
  local nf = require("nightfox")

  nf.setup({
    options = {
      dim_inactive = true, -- Non current window bg to alt color see `hl-NormalNC`
      terminal_colors = true, -- Configure the colors used when opening :terminal
      styles = {
        comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
        functions = "bold,italic", -- Style that is applied to functions: see `highlight-args` for options
        keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
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

return {
  -- Colorschemes
  { 'kuntau/ayu-vim', branch = 'italic' },
  { 'arcticicestudio/nord-vim' },
  { 'NLKNguyen/papercolor-theme' },
  { 'sainnhe/everforest', config = function() vim.g.everforest_background = 'hard' end },
  { 'rakr/vim-one' },
  { 'catppuccin/nvim', name = 'catppuccin', config = true },
  { 'EdenEast/nightfox.nvim', config = config_nightfox },
  { 'marko-cerovac/material.nvim', config = function() vim.g.material_style = "palenight" end },
  { 'folke/tokyonight.nvim' },
  { 'rebelot/kanagawa.nvim', config = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox
}
