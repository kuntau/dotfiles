-- User commands

local dbgi = require('utils.logger').dbgi
local debug = false

-- nvim_create_user_command({name}, {command}, {*opts})
local add_cmd = vim.api.nvim_create_user_command

-- Debugging/DAP
add_cmd('DebugToggle', function() require('dapui').toggle('tray') end, { nargs = 0, desc = 'Toggle Debugging' })
add_cmd('DebugStart', function() require('dapui').start('tray') end, { nargs = 0, desc = 'Start Debugging' })
add_cmd('DebugStop', function() require('dapui').stop('tray') end, { nargs = 0, desc = 'Stop Debugging' })

add_cmd('MaterialSwitchStyle', function() require('material.functions').find_style() end, { nargs = 0, desc = 'Switch Material style' })
add_cmd('Format', function() vim.lsp.buf.format() end, { nargs = 0, desc = 'Format current buffer' }) -- LSP Format

-- FTerm
add_cmd('G', function() require('FTerm').scratch({ cmd = 'gitui' }) end, { nargs = 0, desc = 'Open `gitui` in floating terminal' })
add_cmd('Top', function() require('FTerm').scratch({ cmd = 'btop' }) end, { nargs = 0, desc = 'Open `top` in floating terminal' })
add_cmd('TM', function() require('FTerm').scratch({ cmd = 'tm' }) end, { nargs = 0, desc = 'Open `tm` in floating terminal' })
