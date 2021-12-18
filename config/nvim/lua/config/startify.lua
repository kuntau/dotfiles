-- vim-startify configs

local utils = require('utils')

local formatter = function (files)
  local results = {}
  for _, file in ipairs(files) do
    table.insert(results, { line = file, path = file })
  end
  return results
end

local gitModified = function ()
  return formatter(utils.gitModified())
end

local gitUntracked = function ()
  return formatter(utils.gitUntracked())
end

local gitCommit = function ()
  -- local files = formatter(utils.gitListCommit())
  local results = {}
  for _, file in ipairs(utils.gitListCommit()) do
    table.insert(results, { line = vim.fn.matchstr(file, '\\s\\zs.*'), cmd = '!git show ' .. vim.fn.matchstr(file, '^\\x\\+') })
  end
  return results
end

local cwd = function ()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

vim.g.startify_lists = {
  { header = {('   MRU: ' .. cwd())}, type = 'dir' },
  { header = {'   MRU: Global'},      type = 'files' },
  { header = {'   Sessions'},         type = 'sessions' },
  -- { header = {'   Git modified'},     type = gitModified },
  -- { header = {'   Git untracked'},    type = gitUntracked },
  -- { header = {'   Git commits'},      type = gitCommit },
  -- { header = {'   Bookmarks'},        type = 'bookmarks' },
  { header = {'   Commands'},         type = 'commands' },
}

vim.g.startify_bookmarks = {
  { z = '~/dotfiles/config/zshrc' },
}

vim.g.startify_commands = {
  { tp = { 'Projects', 'Telescope projects' }},
  { to = { 'Old files', 'Telescope oldfiles' }},
  { gs = { 'Git status', 'Telescope git_status' }},
  { gc = { 'Git commits', 'Telescope git_commits' }},
  { pi = { 'Plug Install', 'PlugInstall' }},
  { pu = { 'Update Plugins', 'PlugUpdate' }},
  { ch = { 'Check Health', 'checkhealth' }},
}

vim.g.startify_disable_at_vimenter = 0
vim.g.startify_chnage_to_vcs_root = 1
vim.g.startify_relative_path = 1
vim.g.startify_session_sort = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_change_to_dir = 0
vim.g.startify_update_oldfiles = 0
vim.g.startify_enable_unsafe = 1
vim.g.startify_padding_left = 3
vim.g.startify_files_number = 5
vim.g.startify_fortune_use_unicode = 1
-- vim.g.startify_custom_header = 0
-- vim.g.startify_custom_header = 'startify#center(startify#fortune#boxed())'

vim.g.startify_custom_footerx = {
'                                            ▟▙            ',
'                                            ▝▘            ',
'    ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
'    ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
'    ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
'    ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
'    ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
}

vim.g.startify_custom_header = {
'   ▀██▀─▄███▄─▀██─██▀██▀▀█',
'   ─██─███─███─██─██─██▄█',
'   ─██─▀██▄██▀─▀█▄█▀─██▀█',
'   ▄██▄▄█▀▀▀─────▀──▄██▄▄█',
}
