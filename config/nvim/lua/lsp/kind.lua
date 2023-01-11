-- LSP & cmp kind

local DONE_SETUP = false

-- completion symbols
local icons = {
  Class         = { icon = '', text = 'class' },
  Color         = { icon = '', text = 'color' },
  Constant      = { icon = '', text = 'const' },
  Constructor   = { icon = '', text = 'constr' },
  Folder        = { icon = '', text = 'dir' },
  Enum          = { icon = '', text = 'enum' },
  EnumMember    = { icon = '', text = 'enmbr' },
  Event         = { icon = '', text = 'event' },
  Field         = { icon = '⎵', text = 'field' },
  File          = { icon = '', text = 'file' },
  Function      = { icon = '', text = 'func' },
  Interface     = { icon = '', text = 'iface' },
  Keyword       = { icon = '', text = 'keyword' },
  Method        = { icon = '', text = 'method' },
  Module        = { icon = '', text = 'module' },
  Operator      = { icon = '', text = 'oper' },
  Property      = { icon = '', text = 'prop' },
  Reference     = { icon = '', text = 'ref' },
  Snippet       = { icon = '', text = 'snip' },
  Struct        = { icon = '', text = 'struct' },
  Text          = { icon = '', text = 'text' },
  TypeParameter = { icon = '', text = 'tparam' },
  Unit          = { icon = '', text = 'unit' },
  Value         = { icon = '', text = 'value' },
  Variable      = { icon = '', text = 'var' },
}

local bracket = {
  left = '｢',
  right = '｣',
}

-- TODO: Accept `textwidth` option
local format_kind = function(kind, opts)
  if not opts.text and not opts.icon then return kind end
  local text = opts.text and string.format(' %s', icons[kind].text) or ''
  local icon = opts.icon and icons[kind].icon or ''
  return string.format( '%s%s%s%s', bracket.left, icon, text, bracket.right)
end

local cmp_format = function(opts)
  opts = opts or {}
  return function(entry, vim_item)
    if icons[vim_item.kind] then vim_item.kind = format_kind(vim_item.kind, opts) end
    if opts.menu ~= nil then vim_item.menu = opts.menu[entry.source.name] end
    return vim_item
  end
end

local setup = function(opts)
  if DONE_SETUP then return end
  opts = opts or {}
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = format_kind(kind, opts)
  end
  DONE_SETUP = true
end

return {
  cmp_format = cmp_format,
  setup = setup,
}
