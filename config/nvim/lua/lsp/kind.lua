-- LSP & cmp kind
-- TODO: Accept `textwidth` option

local DONE_SETUP = false

-- completion symbols
local icons = {
  Class         = { icon = '', text = 'class' },
  Color         = { icon = '', text = 'color' },
  Constant      = { icon = '', text = 'constant' },
  Constructor   = { icon = '', text = 'constructor' },
  Folder        = { icon = '', text = 'dir' },
  Enum          = { icon = '', text = 'enum' },
  EnumMember    = { icon = '', text = 'enum member' },
  Event         = { icon = '', text = 'event' },
  Field         = { icon = '⎵', text = 'field' },
  File          = { icon = '', text = 'file' },
  Function      = { icon = '', text = 'function' },
  Interface     = { icon = '', text = 'interface' },
  Keyword       = { icon = '', text = 'keyword' },
  Method        = { icon = '', text = 'method' },
  Module        = { icon = '', text = 'module' },
  Operator      = { icon = '', text = 'operator' },
  Property      = { icon = '', text = 'property' },
  Reference     = { icon = '', text = 'reference' },
  Snippet       = { icon = '', text = 'snippet' },
  Struct        = { icon = '', text = 'struct' },
  Text          = { icon = '', text = 'text' },
  TypeParameter = { icon = '', text = 'type parameter' },
  Unit          = { icon = '', text = 'unit' },
  Value         = { icon = '', text = 'value' },
  Variable      = { icon = '', text = 'variable' },
}

local format_kind = function(kind, opts)
  local text = opts.text or false
  local icon = opts.icon or false
  if not text and not icon then icon = true end
  return string.format('%s %s',(icon and icons[kind].icon or ''),(text and kind or ''))
end

local cmp_format = function(opts)
  opts = opts or {}
  return function(entry, vim_item)
    if icons[vim_item.kind] then
      vim_item.kind = format_kind(vim_item.kind, opts)
    end
    if opts.menu ~= nil then
      vim_item.menu = opts.menu[entry.source.name]
    end
    return vim_item
  end
end

local setup = function (opts)
  if DONE_SETUP then return end
  opts = opts or {}
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = format_kind(kind, opts)
    -- kinds[i] = icons[kind].icon or kind
  end
  DONE_SETUP = true
end

return {
  cmp_format = cmp_format,
  setup = setup
}
