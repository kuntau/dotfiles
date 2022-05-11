-- init.lua --

-- NOS!! https://github.com/lewis6991/impatient.nvim
local impatient_ok, _ = pcall(require, 'impatient')
if not impatient_ok then
  print("failed to require 'impatient'")
end
-- impatient.enable_profile()

local compiled_ok, _ = pcall(require, 'packer_compiled')
if not compiled_ok then
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
  local packer_repo = 'https://github.com/wbthomason/packer.nvim.git'

  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path})
    if PACKER_BOOTSTRAP then
      vim.cmd 'packadd packer.nvim'
      -- disable_cmds = false
      require('plugins').sync()
    end
  else
    vim.cmd [[autocmd User PackerCompileDone quitall]]
    vim.cmd [[packadd packer.nvim | lua require('plugins').compile()]]
  end
end

require('options')
require('mappings')
require('ui')
require('events')
require('commands')
