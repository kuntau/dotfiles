-- vim-startify configs

local git = require('utils.git')
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
'                                                          ',
}

local formatter = function (files)
  local results = {}
  for _, file in ipairs(files) do
    table.insert(results, { line = file, path = file })
  end
  return results
end

local git_modified = function ()
  return a.sync(function ()
    return a.wait(formatter(git.get_modified()))
  end)
end

local git_untracked = function ()
  return formatter(git.get_untracked())
end

local git_commit = function ()
  -- local files = formatter(utils.gitListCommit())
  local results = {}
  for _, file in ipairs(git.get_commit_list()) do
    table.insert(results, { line = ms(file, '\\s\\zs.*'), cmd = '!git show ' .. ms(file, '^\\x\\+') })
  end
  return results
end

local cwd = function ()
  return fnm(gcwd(), ':t')
end

local config_startify = function()
  vim.g.startify_lists = {
    { header = {('   MRU: ' .. cwd())}, type = 'dir' },
    -- { header = {'   MRU: Global'},      type = 'files' },
    -- { header = {'   Sessions'},         type = 'sessions' },
    -- { header = {'   Git modified'},     type = async.git_modified },
    -- { header = {'   Git untracked'},    type = git_utracked },
    -- { header = {'   Git commits'},      type = git_commit },
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
    { og = { 'Neogit',       'Neogit kind=tab' }},
    { ol = { 'Lazy',         'Lazy' }},
    { st = { 'Startup Time', 'StartupTime --tries 5' }},
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

local homepage = 'dashboard'

return {
  {
    'mhinz/vim-startify',
    config = config_startify,
    cmd = 'Startify',
    event = 'VimEnter',
    enabled = (homepage == 'startify'),
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = {
      theme = 'hyper',
      shortcut_type = 'letter',
      shuffle_letter = false,
      config = {
        disable_move = false,
        header = custom_header,
        packages = { enable = false },
        week_header = {
          enable = false,
        },
        shortcut = {
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = function() require('telescope').extensions.smart_open.smart_open({ cwd_only = true }) end,
            key = 'f',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Neogit',
            group = 'String',
            action = 'Neogit',
            key = 'g',
          },
          { desc = ' Lazy', group = '@property', action = 'Lazy', key = 'l' },
          {
            desc = ' Time',
            group = 'DiagnosticHint',
            action = 'StartupTime',
            key = 't',
          },
          {
            desc = ' Health',
            group = 'Number',
            action = 'checkhealth',
            key = 'h',
          },
          {
            desc = ' Mason',
            group = 'DiagnosticInfo',
            action = 'Mason',
            key = 'm',
          },
          {
            desc = ' Exit',
            group = 'DiagnosticError',
            action = 'quit',
            key = 'q',
          },
        },
        project = {
          limit = 5,
          action = function(path)
            vim.fn.chdir(path)
            require('telescope').extensions.smart_open.smart_open({ cwd_only = true })
          end,
        },
        -- mru = { limit = 10, label = 'MRU' },
        footer = {}, -- footer
      },
    },
    enabled = (homepage == 'dashboard'),
  },
}
