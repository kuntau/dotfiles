-- █░█ ▀█▀ █ █░░ █▀
-- █▄█ ░█░ █ █▄▄ ▄█

local mapper = require('utils.mapper')
mapper.setup()

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
  mapper.nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
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
  get_os = get_os,
  get_win_orientation = get_win_orientation,
  quick_close_pane = quick_close_pane,
  reload_module = reload_module,
  autocmd = autocmd,
  mapper = mapper,
  map  = mapper.map,
  tmap = mapper.tmap,
  nmap = mapper.nmap,
  vmap = mapper.vmap,
  imap = mapper.imap,
  xmap = mapper.xmap,
  omap = mapper.omap,
}
