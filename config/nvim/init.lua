-- init.lua --

require('options')
require('ui')
require('config.lazy')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('mappings')
    require('events')
    require('commands')
  end
})
