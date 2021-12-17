-- catppuccin.lua

require('catppuccin').setup({
  integrations = {
    telescope = true,
    neogit = true,
    lsp_saga = true,
    lsp_trouble = true,
    gitsigns = true,
    lightspeed = true,
    ts_rainbow = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true
    },
    nvimtree = {
      enabled = true,
      show_root = true
    }
  }
})
