-- DO NOT change the paths and don't remove the colorscheme
local root = vim.fn.fnamemodify('./.repro', ':p')

-- set stdpaths to use .repro
for _, name in ipairs({ 'config', 'data', 'state', 'cache' }) do
  vim.env[('XDG_%s_HOME'):format(name:upper())] = root .. '/' .. name
end

-- bootstrap lazy
local lazypath = root .. '/plugins/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- install plugins
local plugins = {
  'nyoom-engineering/oxocarbon.nvim',
  'sindrets/diffview.nvim',
  'nvim-lua/plenary.nvim',
  -- add any other plugins here
}
require('lazy').setup(plugins, {
  root = root .. '/plugins',
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = 1, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600 * 2, -- check for updates every hour
  },
  diff = { cmd = 'diffview.nvim' },
})

vim.cmd.colorscheme('oxocarbon')
vim.g.mapleader = [[ ]]
vim.keymap.set('n', 'gol', '<cmd>Lazy<cr>')
vim.o.rnu = 1
-- add anything else here
