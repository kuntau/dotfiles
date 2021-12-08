-- utils.lua

local M = {}

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

M.newMap = function (key)
  local opts = { noremap = true }
  for i, value in pairs(key) do
    print(i, value)
    if type(i) == 'string' then
      print('STRING', value)
      opts[i] = value
      print('OPTS', opts[i])
      -- for index, value in ipairs(t) do
      --   
      -- end
    end
  end

  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    -- vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
    -- print('BUF', key[1], key[2], key[3], opts:get())
    print('BUF', key[1], key[2], key[3], vim.inspect(opts))
  else
    -- vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
    -- print(key[1], key[2], key[3], opts)
    print('ALL', key[1], key[2], key[3], vim.inspect(opts))
  end
end

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

-- M.newMap {'n', 'ga', '<Plug>(EasyAlign)', { noremap = false }}
-- M.newMap {'n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true  }}
M.newMap( { buffer = '%', 'n', 'ga', '<Plug>(EasyAlign)', noremap = false, silent = true  } )
-- M.newMap( { 'n', 'ga', '<Plug>(EasyAlign)', noremap = false, silent = true  } )

return M
