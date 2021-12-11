-- utils.lua

local M = {}

M.isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

M.feedkey = function(key, mode)
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

M.nmap = function (lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

M.vmap = function (lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

M.imap = function (lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

M.xmap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

M.omap = function (lhs, rhs, opts)
  map('x', lhs, rhs, opts)
end

-- Help in new tabs
M.quickClosePane = function()
  if vim.o.buftype == 'help' then -- if it's help pane, do some modifications
    vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
    -- vim.cmd('wincmd T') -- move current buffer to new tab
  end
  M.nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

vim.cmd 'autocmd init_lua FileType help,qf,spectre_panel lua require("utils").quickClosePane()' -- 1st choice

M.reloadModule = function ()
  local module = vim.fn.expand('%:t:r')
  require('plenary.reload').reload_module(module)
  print(module .. ' module reloaded!')
end

return M
