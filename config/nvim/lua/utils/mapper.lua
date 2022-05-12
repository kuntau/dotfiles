-- mapper utils

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

---@param mode string enum of ""|n|v|i|o|x
---@param opts table Mapping options.
local mapper = function (mode, lhs, rhs, opts)
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

local map = function (lhs, rhs, opts)
  mapper('', lhs, rhs, opts)
end

local tmap = function (lhs, rhs, opts)
  mapper('t', lhs, rhs, opts)
end

local nmap = function (lhs, rhs, opts)
  mapper('n', lhs, rhs, opts)
end

local vmap = function (lhs, rhs, opts)
  mapper('v', lhs, rhs, opts)
end

local imap = function (lhs, rhs, opts)
  mapper('i', lhs, rhs, opts)
end

local xmap = function (lhs, rhs, opts)
  mapper('x', lhs, rhs, opts)
end

local omap = function (lhs, rhs, opts)
  mapper('x', lhs, rhs, opts)
end

return {
  map = map,
  tmap = tmap,
  nmap = nmap,
  vmap = vmap,
  imap = imap,
  xmap = xmap,
  omap = omap
}
