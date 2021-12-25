-- init.lua --

require('impatient') -- NOS!! https://github.com/lewis6991/impatient.nvim
require('options')
require('plugins')
require('packer_compiled')
require('ui')
require('mappings')
require('filetypes')

-- Re-source configs on save!
vim.cmd [[
  augroup nvim_configs
    autocmd!
    autocmd BufWritePost *nvim/**.lua :source <afile> | "lua vim.notify('Resourced "'..vim.fn.expand('%:t')..'"!', 2)
  augroup end

  augroup nvim_plugins
    autocmd!
    autocmd BufWritePost plugins.lua :source <afile> | PackerCompile
  augroup end
]]

