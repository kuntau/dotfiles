-- █░█ ▀█▀ █ █░░ █▀
-- █▄█ ░█░ █ █▄▄ ▄█

-- Global helpers
_G.PP = function(...)
  if vim.fn.has('nvim-0.7') == 1 then
    vim.pretty_print(...)
  else
    print(vim.inspect(...))
  end
  return ...
end
-- end global helpers

local is_day = function() return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19 end

---@return string enum of 'macos' | 'wsl' | 'linux' | 'windows'
local get_os = function()
  if vim.fn.has('mac') == 1 then
    return 'macos'
  elseif vim.fn.has('wsl') == 1 then
    return 'wsl'
  elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    return 'windows'
  elseif vim.fn.has('unix') == 1 then
    return 'linux'
  else
    return 'unknown'
  end
end

local get_win_orientation = function() return vim.o.columns <= 154 and 'vertical' or 'horizontal' end

local is_gui = function()
  if vim.fn.has('gui_running') == 1 or vim.g.gonvim_running == 1 or vim.g.neoray == 1 then return true end
  return false
end

local feedkey =
function(key, mode) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true) end

---@param mode string enum of ""|n|v|i|o|x
---@param opts table Mapping options.
local mapper = function(mode, lhs, rhs, opts)
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

local map = function(lhs, rhs, opts) mapper('', lhs, rhs, opts) end
local tmap = function(lhs, rhs, opts) mapper('t', lhs, rhs, opts) end
local nmap = function(lhs, rhs, opts) mapper('n', lhs, rhs, opts) end
local vmap = function(lhs, rhs, opts) mapper('v', lhs, rhs, opts) end
local imap = function(lhs, rhs, opts) mapper('i', lhs, rhs, opts) end
local xmap = function(lhs, rhs, opts) mapper('x', lhs, rhs, opts) end
local omap = function(lhs, rhs, opts) mapper('x', lhs, rhs, opts) end

-- Quickclose some pane
local quick_close_pane = function()
  local orientation = get_win_orientation()
  if vim.o.buftype == 'help' then -- if it's help pane, do some modifications
    if orientation == 'vertical' then
      vim.cmd('wincmd J') -- Move to bottom most split
    else
      vim.cmd('wincmd L') -- Move to right most vsplit
    end
  end
  -- vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
  -- vim.cmd('wincmd T') -- move current buffer to new tab
  nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

local reload_module = function()
  local module = vim.fn.expand('%:t:r')
  if pcall(require, 'plenary') then require('plenary.reload').reload_module(module) end
  print(module .. ' module reloaded!')
  return require(module)
end

-- Borrowed from https://github.com/wbthomason/dotfiles/blob/9134e87b00102cda07f875805f900775244067fe/neovim/.config/nvim/lua/config/utils.lua#L10-L17
---@param group string augroup
---@param cmds string|table autocmd
---@param clear boolean clear augroup
local autocmd = function(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = { cmds } end
  if type(group) == 'string' and #group > 0 then vim.cmd('augroup ' .. group) end
  if clear then vim.cmd([[autocmd!]]) end
  for _, c in ipairs(cmds) do
    vim.cmd('autocmd ' .. c)
  end
  vim.cmd([[augroup END]])
end

-- What function to exposed
return {
  is_day = is_day,
  is_gui = is_gui,
  feedkey = feedkey,
  get_os = get_os,
  get_win_orientation = get_win_orientation,
  quick_close_pane = quick_close_pane,
  reload_module = reload_module,
  autocmd = autocmd,
  map = map,
  tmap = tmap,
  nmap = nmap,
  vmap = vmap,
  imap = imap,
  xmap = xmap,
  omap = omap,
}
