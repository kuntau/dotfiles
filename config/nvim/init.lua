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
require('events')
