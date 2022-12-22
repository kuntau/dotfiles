-- vim-startify configs

local utils = require('utils')
local a     = require('utils.async')
local ms    = vim.fn.matchstr
local fnm   = vim.fn.fnamemodify
local gcwd  = vim.fn.getcwd

local custom_header = {
'    ██████████████████████████  ██████████████████████████',
'    ██                      ██  ██                      ██',
'    ██  ██  ██  ██████████  ██  ██  ██████  ██  ██  ██  ██',
'    ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██  ██  ██  ██████  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██  ██  ██          ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██████  ██████████  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██              ██  ██  ██      ██  ██  ██  ██  ██',
'    ██  ██████  ██████  ██  ██  ██  ██████  ██  ██  ██  ██',
'    ██  ██  ██      ██  ██  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██████████████████  ██  ██  ██████████████  ██  ██',
'    ██                      ██  ██                      ██',
'    ██████████████████████████  ██████████████████████████',
}

local formatter = function (files)
  local results = {}
  for _, file in ipairs(files) do
    table.insert(results, { line = file, path = file })
  end
  return results
end

local gitModified = function ()
  return a.sync(function ()
    return a.wait(formatter(utils.gitModified()))
  end)
end

local gitUntracked = function ()
  return formatter(utils.gitUntracked())
end

local gitCommit = function ()
  -- local files = formatter(utils.gitListCommit())
  local results = {}
  for _, file in ipairs(utils.gitListCommit()) do
    table.insert(results, { line = ms(file, '\\s\\zs.*'), cmd = '!git show ' .. ms(file, '^\\x\\+') })
  end
  return results
end

local cwd = function ()
  return fnm(gcwd(), ':t')
end

local startify_config = function()
  vim.g.startify_lists = {
    { header = {('   MRU: ' .. cwd())}, type = 'dir' },
    -- { header = {'   MRU: Global'},      type = 'files' },
    { header = {'   Sessions'},         type = 'sessions' },
    -- { header = {'   Git modified'},     type = async.gitModified },
    -- { header = {'   Git untracked'},    type = gitUntracked },
    -- { header = {'   Git commits'},      type = gitCommit },
    -- { header = {'   Bookmarks'},        type = 'bookmarks' },
    { header = {'   Commands'},         type = 'commands' },
  }
  vim.g.startify_bookmarks = {
    { z = '~/dotfiles/config/zshrc' },
  }
  vim.g.startify_commands = {
    { fp = { 'Projects',     'Telescope projects' }},
    { fo = { 'Old files',    'Telescope oldfiles' }},
    { ff = { 'Frecency',     'Telescope frecency' }},
    { fc = { 'Git commits',  'Telescope git_commits' }},
    { og = { 'Neogit',       'Neogit' }},
    { ol = { 'Lazy',         'Lazy' }},
    { st = { 'Startup Time', 'StartupTime' }},
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
  vim.g.startify_files_number = 10
  vim.g.startify_fortune_use_unicode = 1
  vim.g.startify_custom_header = custom_header
end

return {
  startify = startify_config
}
