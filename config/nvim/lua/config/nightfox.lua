-- Nightfox colorscheme configs

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
