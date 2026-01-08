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
add_cmd('TSRainbowEnable', function() require('ts-rainbow') end, { nargs = 0 })

-- FTerm
add_cmd('G', function() require('FTerm').scratch({ cmd = 'gitui' }) end, { nargs = 0, desc = 'Open `gitui` in floating terminal' })
add_cmd('Top', function() require('FTerm').scratch({ cmd = 'btop' }) end, { nargs = 0, desc = 'Open `top` in floating terminal' })
add_cmd('LG', function() require('FTerm').scratch({ cmd = 'lazygit --debug --screen-mode=half' }) end, { nargs = 0, desc = 'Open `LazyGit` in floating terminal' })
add_cmd('Lazygit', function() Snacks.terminal.toggle('lazygit') end, { nargs = 0, desc = 'Open `lazygit` in floating terminal' })

-- UndoTree
add_cmd('UndoTreeToggle', function() require('undotree').toggle() end, { nargs = 0, desc = 'Toggle UndoTree' })

-- Scratch
add_cmd('Scratch', function() Snacks.scratch() end, { nargs = 0, desc = 'Toggle Scratch Buffer' })
