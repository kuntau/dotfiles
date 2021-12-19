-- utils.lua

local Utils = {}

Utils.isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

-- @return: 'macos' | 'wsl' | 'linux' | 'windows'
Utils.getOS = function ()
  if vim.fn.has('mac') == 1 then
    return 'macos'
  elseif vim.fn.has('wsl') == 1 then
    return 'wsl'
  elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    return 'windows'
  elseif vim.fn.has('unix') == 1 then
    return 'linux'
  else
    return nil
  end
end

Utils.getWinOrientation = function ()
  return vim.fn.winwidth(0) <= 152 and 'vertical' or 'horizontal'
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
  local orientation = Utils.getWinOrientation()
  if vim.o.buftype == 'help' and orientation == 'vertical' then -- if it's help pane, do some modifications
    vim.cmd 'wincmd J' -- Move to bottom most split
  else
    vim.cmd 'wincmd L' -- Move to right most vsplit
  end
    -- vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
    -- vim.cmd('wincmd T') -- move current buffer to new tab
  Utils.nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

Utils.isGitRepo = function()
  return (string.find(vim.fn.system('git rev-parse --is-inside-work-tree'), 'true') == 1)
end

-- Git utils function
Utils.gitModified = function ()
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git ls-files -m')
  else return {}
  end
end

Utils.gitUntracked = function ()
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git ls-files -o --exclude-standard')
  else return {}
  end
end

Utils.gitListCommit = function (count)
  local commitCount = count or 5
  if Utils.isGitRepo() then
    return vim.fn.systemlist('git log --oneline | head -n' .. commitCount)
  else return {}
  end
end

Utils.reloadModule = function ()
  local module = vim.fn.expand('%:t:r')
  require('plenary.reload').reload_module(module)
  print(module .. ' module reloaded!')
end

return Utils
