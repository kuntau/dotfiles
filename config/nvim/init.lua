-- init.lua --

if vim.fn.has('nvim-0.10') == 1 then
  vim.loader.enable()
end

require('config.options')
require('config.lazy')
require('config.ui')
require('config.events')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('config.mappings')
    require('config.commands')
  end
})
