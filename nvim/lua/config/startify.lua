-- vim-startify configs

vim.g.startify_lists = {
  { header =  {('   MRU ' .. vim.fn.getcwd())}, type = 'dir' },
  { header =  {'   Global MRU'},                type = 'files' },
  { header =  {'   Sessions'},                  type = 'sessions' },
  { header =  {'   Bookmarks'},                 type = 'bookmarks' },
  { header =  {'   Git modified'},              type = require('utils').gitModified },
  { header =  {'   Git untracked'},             type = require('utils').gitUntracked },
  { header =  {'   Commands'},                  type = 'commands' },
}

vim.g.startify_bookmarks = {
  { z = '~/dotfiles/config/zshrc' },
}

vim.g.startify_commands = {
  { p = { 'Upgrade Plug', 'PlugUpgrade' }},
  { u = { 'Update Plugins', 'PlugUpdate' }},
  { tsu = { 'Treesitter Update', 'TSUpdate' }},
  { tss = { 'Treesitter UpdateSync', 'TSUpdateSync' }},
  { ch = { 'Check Health', 'checkhealth' }},
  { lsp = { 'LSP Info', 'LspInfo' }},
}

vim.g.startify_disable_at_vimenter = 0
vim.g.startify_chnage_to_vcs_root = 1
vim.g.startify_relative_path = 1
vim.g.startify_session_sort = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_change_to_dir = 0
vim.g.startify_update_oldfiles = 1
vim.g.startify_enable_unsafe = 0
vim.g.startify_padding_left = 3
vim.g.startify_files_number = 6
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_custom_header = 0
-- vim.g.startify_custom_header = 'startify#center(startify#fortune#boxed())'

vim.g.startifyx_custom_header = [[
                                         ▟▙            
                                         ▝▘            
 ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖
 ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██
 ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██
 ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██
 ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀

]]

-- vim.g.startify_custom_header = startify_ascii_header
