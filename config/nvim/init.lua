-- init.lua --

-- NOS!! https://github.com/lewis6991/impatient.nvim
local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
  print("failed to require 'impatient'")
end
-- impatient.enable_profile()

local compiled_ok, _ = pcall(require, 'packer_compiled')
if not compiled_ok then
  vim.api.nvim_command [[packadd packer.nvim | lua require('plugins').sync()]]
  require('plugins')
end

require('options')
require('mappings')
require('ui')
require('events')

if vim.fn.has('nvim-0.7') == 1 then
  require('commands')
end
