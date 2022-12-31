-- User commands

local dbgi = require("utils.logger").dbgi
local debug = false

-- nvim_create_user_command({name}, {command}, {*opts})
local add_cmd = vim.api.nvim_create_user_command

add_cmd('YankOSC52', '<Plug>(YankOSC52)', {nargs = 0})
-- FTerm
add_cmd('G', function () require("FTerm").scratch({ cmd = 'gitui' }) end, { nargs = 0, desc = "Open `gitui` in floating terminal" })
add_cmd('Top', function () require("FTerm").scratch({ cmd = 'btop' }) end, { nargs = 0, desc = "Open `top` in floating terminal" })
add_cmd('TM', function () require("FTerm").scratch({ cmd = 'tm' }) end, { nargs = 0, desc = "Open `tm` in floating terminal" })
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
