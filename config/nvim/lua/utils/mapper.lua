-- mapper utils

---@class mapper
local M = {}

-- local function replace_termcodes(key, part, lt, special)
--   return vim.api.nvim_replace_termcodes(key, part, lt, special)
-- end

-- local function feedkey(key, mode)
--   return vim.api.nvim_feedkeys(replace_termcodes(key, true, true, true), mode, true)
-- end

---@param mode string enum of ""|n|v|i|o|x
---@param opts table Mapping options.
local function mapper(mode, lhs, rhs, opts)
  vim.validate({
    mode = { mode, { 's', 't' } },
    lhs = { lhs, 's' },
    rhs = { rhs, { 's', 'f' } },
    opts = { opts, 't', true },
  })

  local default_opts = { noremap = true, silent = true }
  opts = vim.tbl_extend('force', default_opts, opts or {})

  if type(rhs) == 'function' then
    opts.callback = rhs
    rhs = ''
  end

  if opts.buffer then
    local bufnr = opts.buffer == true and 0 or opts.buffer
    opts.buffer = nil
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

M.setup = function()
  local modes = { map = '', nmap = 'n', vmap = 'v', imap = 'i', tmap = 't', xmap = 'x', omap = 'o', cmap = 'c' }
  for map, mode in pairs(modes) do
    M[map] = function(...) mapper(mode, ...) end
  end
end

return M
