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
	  -- vim.call('wincmd T')
	  vim.api.nvim_buf_set_keymap('n','q',':q<cr>')
  end
end
-- vim.cmd [[autocmd vimrc BufEnter *.txt v:lua.helpTab()]]

M.rmap = function (mode, lhs, rhs, opts)
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
    -- print('buf', lhs, rhs, vim.inspect(options))
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    -- print(mode, lhs, rhs, vim.inspect(options))
  end
end

M.mmap = function (mode, keymap)
  local opts = { noremap = true, silent = true }
  -- print(keymap[2])
  for key, value in pairs(keymap) do
    -- print(key, value)
    if type(key) == 'string' then
      -- print('STRING', value)
      opts[key] = value
      -- print('OPTS', opts[i])
    end
  end

  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    -- vim.api.nvim_buf_set_keymap(0, mode, keymap[1], keymap[2], opts)
    -- print('BUF', key[1], key[2], key[3], opts:get())
    print('buf', mode, keymap[1], keymap[2], vim.inspect(opts))
  else
    vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    -- print(key[1], key[2], key[3], opts)
    -- print(mode, keymap[1], keymap[2], vim.inspect(opts))
  end
end

M.map = function (mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function (lhs, rhs, opts)
  M.rmap('n', lhs, rhs, opts)
end

M.vmap = function (lhs, rhs, opts)
  M.rmap('v', lhs, rhs, opts)
end

M.imap = function (lhs, rhs, opts)
  M.rmap('i', lhs, rhs, opts)
end

-- M.rmap( 'n', { 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = false }  } )
M.nmap( 'ga', '<Plug>(EasyAlign)', { noremap = false } )
-- M.nnmap( 'v', 'ga', '<Plug>(EasyAlign)')
-- M.nnmap( 'v', { 'ga', '<Plug>(EasyAlign)' } )
-- M.nnmap( 'v', { 'ga', '<Plug>(EasyAlign)', { buffer = true, silent = false } } )
-- M.nnmap( 'v', { 'ga', '<Plug>(EasyAlign)', { noremap = false } } )
-- M.nnmap( { 'ga', '<Plug>(EasyAlign)', noremap = false, silent = false  } )

return M
