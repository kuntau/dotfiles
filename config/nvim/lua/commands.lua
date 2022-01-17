-- User commands

local dbgi = require("utils.logger").dbgi
local debug = true

-- nvim_add_user_command({name}, {command}, {*opts})
local add_cmd = vim.api.nvim_add_user_command

-- Packer commands
add_cmd('Pac', function (cmd)
  vim.cmd 'packadd packer.nvim'
  -- local packer = require("packer")
  local plugin = require("plugins")
  local arg   = string.lower(cmd.args) or nil

  if cmd and debug then
    dbgi(cmd, arg)
  end

  if arg == 'clean' then
    plugin.clean()
  elseif arg == 'update' then
    plugin.update()
  elseif arg == 'install' then
    plugin.install()
  elseif arg == 'sync' then
    plugin.sync()
  elseif arg == 'status' then
    plugin.status()
  elseif arg == 'profile' then
    plugin.profile_output()
  elseif arg == 'compile' then
    plugin.compile()
  elseif arg == 'compile+profile' then
    plugin.compile('profile=true')
  else
    vim.notify('Packer Error: No command for '..arg, vim.log.levels.ERROR)
  end
end, {
    nargs = '?',
    complete = function ()
      return { 'Clean', 'Compile', 'Update', 'Sync', 'Install', 'Profile', 'Status', 'Compile+Profile' }
    end
})

-- command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)
-- command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)
-- command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)
-- command! PackerClean packadd packer.nvim | lua require('plugins').clean()
-- command! PackerCompile packadd packer.nvim | lua require('plugins').compile('~/.config/nvim/plugin/packer_load.vim')
-- command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>')
-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete  PackerInstall lua require('packer').install(<f-args>)]]
-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)]]
-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)]]
-- vim.cmd [[command! PackerClean             lua require('packer').clean()]]
-- vim.cmd [[command! -nargs=* PackerCompile  lua require('packer').compile(<q-args>)]]
-- vim.cmd [[command! PackerStatus            lua require('packer').status()]]
-- vim.cmd [[command! PackerProfile           lua require('packer').profile_output()]]
-- vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>' == '!')]]
