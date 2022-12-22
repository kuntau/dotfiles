-- init.lua --

require('options')
require('config.lazy')
require('ui')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('mappings')
    require('events')
    require('commands')
  end
})
