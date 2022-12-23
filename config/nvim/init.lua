-- init.lua --

require('config.options')
require('config.lazy')
require('config.ui')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('config.mappings')
    require('config.events')
    require('config.commands')
  end
})
