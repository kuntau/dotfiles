-- utils.lua

local Utils = {}

Utils.isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

Utils.getRatio = function ()
  return vim.fn.winwidth(0) > vim.fn.winheight(0) and 'horizontal' or 'vertical'
end
Utils.feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local map = function (mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts and type(opts) == 'table' then
    for key, value in pairs(opts) do
      options[key] = value
    end
  end

  local buffer = options.buffer
  options.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

Utils.nmap = function (lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

Utils.vmap = function (lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

Utils.imap = function (lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

Utils.xmap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

Utils.omap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

-- Quickclose some pane
Utils.quickClosePane = function()
  if vim.o.buftype == 'help' then -- if it's help pane, do some modifications
    vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
    -- vim.cmd('wincmd T') -- move current buffer to new tab
  end
  Utils.nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

vim.cmd 'autocmd init_lua FileType help,qf,spectre_panel lua require("utils").quickClosePane()' -- 1st choice

Utils.isGitRepo = function()
  return vim.fn.system('git rev-parse --is-inside-work-tree')
end

-- Git utils function
Utils.gitModified = function ()
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git ls-files -m')
  end
end

Utils.gitUntracked = function ()
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git ls-files -o --exclude-standard')
  end
end

Utils.gitListCommit = function ()
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git log --oneline | head -n10')
  end
end

Utils.reloadModule = function ()
  local module = vim.fn.expand('%:t:r')
  require('plenary.reload').reload_module(module)
  print(module .. ' module reloaded!')
end

return Utils
