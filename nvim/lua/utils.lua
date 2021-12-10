-- utils.lua

local M = {}

M.isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

M.feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Help in new tabs
M.helpTab = function()
  if vim.o.buftype == 'help' then
    vim.cmd('resize') -- resize help buffer to maximum (CTRL-W__)
    -- vim.cmd('wincmd T') -- move current buffer to new tab
  end
  M.nmap('q', ':q<cr>', { buffer = true }) -- map `q` to close help buffer
end

vim.cmd 'autocmd vimrc FileType help,qf lua require("utils").helpTab()' -- 1st choice
-- vim.cmd 'autocmd vimrc BufEnter *.txt lua require("utils").helpTab()' -- 2nd choice
-- vim.cmd [[autocmd vimrc BufEnter *.txt lua require('utils').helpTab()]] -- 3rd choice
-- vim.cmd [[autocmd vimrc BufEnter *.txt v:lua.helpTab()]] -- 4th choice, need to set our function to _G.

M.map = function (mode, lhs, rhs, opts)
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
  M.map('n', lhs, rhs, opts)
end

M.vmap = function (lhs, rhs, opts)
  M.map('v', lhs, rhs, opts)
end

M.imap = function (lhs, rhs, opts)
  M.map('i', lhs, rhs, opts)
end

M.xmap = function (lhs, rhs, opts)
  M.map('x', lhs, rhs, opts)
end

M.omap = function (lhs, rhs, opts)
  M.map('x', lhs, rhs, opts)
end

return M
