-- utils.lua

local M = {}
-- local F = vim.fn

M.isDay = function()
  return tonumber(vim.fn.strftime('%H')) > 8 and tonumber(vim.fn.strftime('%H')) < 19
end

M.termcode = function(key)
  vim.api.nvim_replace_termcodes(key, true, true, true)
end

M.feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Help in new tabs
M.helpTab = function()
  if vim.o.buftype == 'help' then
	  -- vim.call('wincmd T')
	  vim.api.nvim_buf_set_keymap('n','q',':q<cr>')
  end
end
-- vim.cmd [[autocmd vimrc BufEnter *.txt v:lua.helpTab()]]

M.map = function (mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function (shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function (shortcut, command)
  M.map('i', shortcut, command)
end

M.vmap = function (shortcut, command)
  M.map('v', shortcut, command)
end

return M
