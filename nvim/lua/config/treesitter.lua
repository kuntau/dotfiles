-- treesitter.lua

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    addtional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
})
