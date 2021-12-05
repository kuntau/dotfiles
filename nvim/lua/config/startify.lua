-- vim-startify configs

-- let g:startify_lists = [
--   \ { 'type': 'files',     'header': ['   MRU']            },
--   \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
--   \ { 'type': 'sessions',  'header': ['   Sessions']       },
--   \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
--   \ { 'type': function('<SID>gitModified'),  'header': ['   git modified']},
--   \ { 'type': function('<SID>gitUntracked'), 'header': ['   git untracked']},
--   \ { 'type': 'commands',  'header': ['   Commands']       },
--   \ ]

vim.g.startify_lists = {
  { type = 'files', header =  {'   Global MRU'} },
  { type = 'dir', header =  {('   MRU ' .. vim.fn.getcwd())}},
  { type = 'sessions', header =  {'   Sessions'} },
  { type = 'bookmarks', header =  {'   Bookmarks'} },
  { type = 'commands', header =  {'   Commands'} },
}

vim.g.startify_bookmarks = {
  'd: ~/dotfiles/',
  'g: ~/coding/'
}

vim.g.startify_commands = {
  { p = { 'Upgrade Plug', 'PlugUpgrade' }},
  { u = { 'Update Plugins', 'PlugUpdate' }},
  { c = { 'Update CoC Extensions', 'CocUpdateSync' }},
}

vim.g.startify_fortune_use_unicode = 1
vim.g.startify_padding_left = 3
vim.g.startify_session_sort = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_change_to_dir = 0
vim.g.startify_update_oldfiles = 1
vim.g.startify_enable_unsafe = 1
vim.g.startify_custom_header = 0
-- let g:startify_custom_header = 'startify#center(startify#fortune#boxed())'
