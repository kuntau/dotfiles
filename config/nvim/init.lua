-- init.lua --

if vim.loader then
  vim.loader.enable()
end

require('config.options')
require('config.lazy')
require('config.ui')

local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VeryLazy",
  callback = function()
    require('config.events')
    require('config.mappings')
    require('config.commands')
    require('oil').setup()
  end
})
