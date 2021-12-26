-- catppuccin.lua

require('catppuccin').setup({
  integrations = {
    cmp         = true,
    gitsigns    = true,
    lightspeed  = true,
    lsp_saga    = true,
    lsp_trouble = true,
    markdown    = true,
    neogit      = true,
    telescope   = true,
    ts_rainbow  = true,
    indent_blankline = {
      enabled               = true,
      colored_indent_levels = true
    },
    nvimtree = {
      enabled   = true,
      show_root = true
    }
  }
})
