-- catppuccin.lua

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
