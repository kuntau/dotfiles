-- mapper utils

local dbgi = require('utils.logger').dbgi
local debug = false

---@class Mapper
local M = {}

---@param key string Key to convert
---@param part? boolean
---@param lt? boolean
---@param special? boolean
M.replace_termcodes = function(key, part, lt, special)
  part = part or true
  lt = lt or true
  special = special or true
  return vim.api.nvim_replace_termcodes(key, part, lt, special)
end

---@param key string Key to convert
---@param mode string Behaviour flags, see feedkeys
---@param escape? boolean
M.feedkey = function(key, mode, escape)
  escape = escape or false
  return vim.api.nvim_feedkeys(M.replace_termcodes(key), mode, escape)
end

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
  opts = vim.tbl_deep_extend('force', default_opts, opts or {})

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

---@param desc_or_opts string|table if string it will be description
---@param ext_opts? table if desc_or_opts is string, we can pass another opts table
local make_opts = function(desc_or_opts, ext_opts)
  local opts = {}

  if type(desc_or_opts) == 'string' then
    opts.desc = desc_or_opts
  elseif type(desc_or_opts) == 'table' then
    opts = desc_or_opts
  end

  if ext_opts ~= nil and type(ext_opts) == 'table'then
    opts = vim.tbl_deep_extend('force', opts, ext_opts)
  end

  if debug then dbgi('Results: ', vim.pretty_print(opts)) end
  return opts
end

M.setup = function()
  local modes = { map = '', nmap = 'n', vmap = 'v', imap = 'i', tmap = 't', xmap = 'x', omap = 'o', cmap = 'c' }
  for map, mode in pairs(modes) do
    M[map] = function(lhs, rhs, ...)
      local opts = ... ~= nil and make_opts(...) or {}
      mapper(mode, lhs, rhs, opts)
    end
  end
end

return M
