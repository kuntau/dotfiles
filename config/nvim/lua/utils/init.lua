-- utils.lua

local fn = vim.fn
local cmd = vim.cmd

-- Global helpers
_G.I = function (...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  -- print(table.concat(objects, '\n'))
  return ...
end

_G.PP = function (...)
  if fn.has('nvim-0.7') == 1 then vim.pretty_print(...)
  else P(I(...)) end
  return ...
end

_G.P = function (...)
  print(...)
  return ...
end
-- end global helpers

local isDay = function()
  return tonumber(fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

---@return string enum of 'macos' | 'wsl' | 'linux' | 'windows'
local getOS = function ()
  if fn.has('mac') == 1 then return 'macos'
  elseif fn.has('wsl') == 1 then return 'wsl'
  elseif fn.has('win32') == 1 or vim.fn.has('win64') == 1 then return 'windows'
  elseif fn.has('unix') == 1 then return 'linux'
  else return nil
  end
end

local getWinOrientation = function ()
  return vim.o.columns <= 152 and 'vertical' or 'horizontal'
end

local isGui = function ()
  if fn.has('gui_running') == 1 or
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
local mapper = function (mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts and type(opts) == 'table' then
    for key, value in pairs(opts) do
      options[key] = value
    end
  end

  local bufo = options.buffer
  local bufnr = (type(bufo) == 'number' and bufo) or (bufo == true and vim.api.nvim_get_current_buf())
  options.buffer = nil

  if bufnr then
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local map = function (lhs, rhs, opts)
  mapper('', lhs, rhs, opts)
end

local tmap = function (lhs, rhs, opts)
  mapper('t', lhs, rhs, opts)
end

local nmap = function (lhs, rhs, opts)
  mapper('n', lhs, rhs, opts)
end

local vmap = function (lhs, rhs, opts)
  mapper('v', lhs, rhs, opts)
end

local imap = function (lhs, rhs, opts)
  mapper('i', lhs, rhs, opts)
end

local xmap = function (lhs, rhs, opts)
  mapper('x', lhs, rhs, opts)
end

local omap = function (lhs, rhs, opts)
  mapper('x', lhs, rhs, opts)
end

-- Quickclose some pane
local quickClosePane = function()
  local orientation = getWinOrientation()
  if vim.o.buftype == 'help' then -- if it's help pane, do some modifications
    if orientation == 'vertical' then
      cmd 'wincmd J' -- Move to bottom most split
    else
      cmd 'wincmd L' -- Move to right most vsplit
    end
  end
  -- cmd('resize') -- resize help buffer to maximum (CTRL-W__)
  -- cmd('wincmd T') -- move current buffer to new tab
  nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

local isGitRepo = function()
  return (string.find(fn.system('git rev-parse --is-inside-work-tree'), 'true') == 1)
end

-- Git utils function
local gitModified = function ()
  if isGitRepo() then
    return fn.systemlist('git ls-files -m')
  else return {}
  end
end

local gitUntracked = function ()
  if isGitRepo() then
    return fn.systemlist('git ls-files -o --exclude-standard')
  else return {}
  end
end

local gitListCommit = function (count)
  local commitCount = count or 5
  if isGitRepo() then
    return fn.systemlist('git log --oneline | head -n' .. commitCount)
  else return {}
  end
end

local reloadModule = function ()
  local module = fn.expand('%:t:r')
  if pcall(require, 'plenary') then
    require('plenary.reload').reload_module(module)
  end
  print(module .. ' module reloaded!')
  return require(module)
end

-- Borrowed from https://github.com/wbthomason/dotfiles/blob/9134e87b00102cda07f875805f900775244067fe/neovim/.config/nvim/lua/config/utils.lua#L10-L17
---@param group string augroup
---@param cmds string|table autocmd
---@param clear boolean clear augroup
local autocmd = function (group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = {cmds} end
  if type(group) == 'string' and #group > 0 then cmd('augroup ' .. group) end
  if clear then cmd [[autocmd!]] end
  for _, c in ipairs(cmds) do cmd('autocmd ' .. c) end
  cmd [[augroup END]]
end

-- What function to exposed
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
  autocmd = autocmd,
  map  = map,
  tmap = tmap,
  nmap = nmap,
  vmap = vmap,
  imap = imap,
  xmap = xmap,
  omap = omap,
}
