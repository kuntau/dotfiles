-- utils.lua

-- Global helpers
_G.I = function (v)
  return vim.inspect(v)
end

_G.P = function (v)
  print(v)
  return v
end
-- end global helpers

local isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

---@return string enum of 'macos' | 'wsl' | 'linux' | 'windows'
local getOS = function ()
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

local getWinOrientation = function ()
  return vim.o.columns <= 152 and 'vertical' or 'horizontal'
end

local isGui = function ()
  if vim.fn.has('gui_running') == 1 or
    vim.g.gonvim_running == 1 or
    vim.g.neoray == 1 then
    return true
  end
  return false
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

---@param mode string enum of ""|n|v|i|o|x
---@param opts table Mapping options.
local map = function (mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts and type(opts) == 'table' then
    for key, value in pairs(opts) do
      options[key] = value
    end
  end

  local bufnr = options.buffer
  options.buffer = nil

  if bufnr then
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local nmap = function (lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local vmap = function (lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local imap = function (lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

local xmap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

local omap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

-- Quickclose some pane
local quickClosePane = function()
  local orientation = getWinOrientation()
  if vim.o.buftype == 'help' then 
    if orientation == 'vertical' then -- if it's help pane, do some modifications
      vim.cmd 'wincmd J' -- Move to bottom most split
    else
      vim.cmd 'wincmd L' -- Move to right most vsplit
    end
  end
  -- vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
  -- vim.cmd('wincmd T') -- move current buffer to new tab
  nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

local isGitRepo = function()
  return (string.find(vim.fn.system('git rev-parse --is-inside-work-tree'), 'true') == 1)
end

-- Git utils function
local gitModified = function ()
  if isGitRepo() then
    return vim.fn.systemlist('git ls-files -m')
  else return {}
  end
end

local gitUntracked = function ()
  if isGitRepo() then
    return vim.fn.systemlist('git ls-files -o --exclude-standard')
  else return {}
  end
end

local gitListCommit = function (count)
  local commitCount = count or 5
  if isGitRepo() then
    return vim.fn.systemlist('git log --oneline | head -n' .. commitCount)
  else return {}
  end
end

local reloadModule = function ()
  local module = vim.fn.expand('%:t:r')
  if pcall(require, 'plenary') then
    require('plenary.reload').reload_module(module)
  end
  print(module .. ' module reloaded!')
  return require(module)
end

return {
  isDay = isDay,
  isGui = isGui,
  isGitRepo = isGitRepo,
  feedkey = feedkey,
  getOS = getOS,
  getWinOrientation = getWinOrientation,
  gitModified = gitModified,
  gitUntracked = gitUntracked,
  gitListCommit = gitListCommit,
  quickClosePane = quickClosePane,
  reloadModule = reloadModule,
  nmap = nmap,
  vmap = vmap,
  imap = imap,
  xmap = xmap,
  omap = omap,
}
