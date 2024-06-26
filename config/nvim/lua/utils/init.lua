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

local is_day = function() return tonumber(vim.fn.strftime('%H')) >= 8 and tonumber(vim.fn.strftime('%H')) < 19 end

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

-- gui_running check requires nvim v0.9 https://github.com/neovim/neovim/pull/22382
local is_gui = function()
  if vim.fn.has('gui_running') == 1 or vim.g.gonvim_running == 1 or vim.g.neoray == 1 or vim.g.neovide == 1 then return true end
  return false
end

---Check if a table contains only table
---@param tbl table
---@return boolean
local is_tbl_only = function(tbl)
  if type(tbl) ~= 'table' then
    return false
  else
    for _, v in pairs(tbl) do
      if type(v) ~= 'table' then return false end
    end
  end
  return true
end

-- Quickclose some pane
local quick_close_pane = function()
  local ori, ft = get_win_orientation(), vim.bo.filetype
  if ft == 'help' or ft == 'man' then -- if it's help pane, do some modifications
    if ori == 'vertical' then
      vim.cmd('wincmd J') -- Move to bottom most split
    else
      vim.cmd('wincmd L') -- Move to right most vsplit
    end
  end
  -- vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
  -- vim.cmd('wincmd T') -- move current buffer to new tab
  mapper['nmap']('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
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
local autocmd_legacy = function(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = { cmds } end
  if type(group) == 'string' and #group > 0 then vim.cmd('augroup ' .. group) end
  if clear then vim.cmd([[autocmd!]]) end
  for _, c in ipairs(cmds) do
    vim.cmd('autocmd ' .. c)
  end
  vim.cmd([[augroup END]])
end

---@param group string Group name
---@param autocmds table Autocommands
---@param desc? string Group description
---@param clear? boolean Should we clear the group? Default true
local autocmd = function(group, autocmds, desc, clear)
  local opts, group_opts = {}, {}

  if type(clear) == 'boolean' then
    group_opts.clear = clear
  end

  if type(desc) == 'string' and #desc > 0 then
    opts.desc = desc
  end

  opts.group = (type(group) == 'string' and #group > 0) and vim.api.nvim_create_augroup(group, group_opts) or nil

  ---@param event string|string[]
  ---@param pttrn_or_bufnr string|string[]|integer
  ---@param cmds string|string[]|fun(_)
  ---@param cmd_opts? table autocmd options
  local process_cmds = function(event, pttrn_or_bufnr, cmds, cmd_opts)
    cmd_opts = type(cmd_opts) == 'table' and cmd_opts or {}
    cmds = type(cmds) == 'table' and cmds or { cmds }
    for _, cmd in pairs(cmds) do

      if type(pttrn_or_bufnr) == 'number' then
        opts.buffer = pttrn_or_bufnr
      elseif pttrn_or_bufnr == nil then
        opts.pattern = '*' -- set to catch all if pattern is nil
      else
        opts.pattern = pttrn_or_bufnr
      end

      opts.command, opts.callback = nil, nil -- reset command & callback
      if type(cmd) == 'string' and #cmd > 0 then
        opts.command = cmd
      elseif type(cmd) == 'function' then
        opts.callback = cmd
      end

      cmd_opts = vim.tbl_deep_extend('force', opts, cmd_opts) -- force any extra options
      vim.api.nvim_create_autocmd(event, cmd_opts)
      -- opts = {}
    end
  end

  -- check if we have only single table
  autocmds = is_tbl_only(autocmds) and autocmds or { autocmds }
  for _, autocmdx in pairs(autocmds) do
    process_cmds(unpack(autocmdx))
  end

end

---@param url string URL
local open_url = function(url)
  local opener
  if vim.fn.has("macunix") == 1 then
    opener = "open"
  elseif vim.fn.has("linux") == 1 then
    opener = "xdg-open"
  elseif vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
    opener = "start"
  end
  os.execute(opener .. " '" .. url .. "'")
end

---@class Utils
return {
  is_day = is_day,
  is_gui = is_gui,
  get_os = get_os,
  get_win_orientation = get_win_orientation,
  quick_close_pane = quick_close_pane,
  is_tbl_only = is_tbl_only,
  reload_module = reload_module,
  autocmd = autocmd,
  autocmd_legacy = autocmd_legacy,
  open_url = open_url,
  mapper = mapper,
  map  = mapper['map'],
  cmap = mapper['cmap'],
  imap = mapper['imap'],
  nmap = mapper['nmap'],
  omap = mapper['omap'],
  tmap = mapper['tmap'],
  vmap = mapper['vmap'],
  xmap = mapper['xmap'],
}
