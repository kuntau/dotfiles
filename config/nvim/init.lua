-- init.lua --

-- NOS!! https://github.com/lewis6991/impatient.nvim
local ok, impatient = pcall(require, 'impatient')
if not ok then
  print("failed to require 'impatient'")
  return
end

require('options')
require('packer_compiled')
require('plugins')
require('ui')
require('mappings')
require('filetypes')

local utils = require('utils')
local autocmd = utils.autocmd

-- Re-source configs on save!
autocmd('nvim_configs', [[BufWritePost *nvim/**.lua :source <afile>]], true)
autocmd('nvim_compile', [[BufWritePost *nvim/lua/plugins.lua PackerCompile]], true)
