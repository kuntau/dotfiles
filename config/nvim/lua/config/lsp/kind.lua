-- LSP & cmp kind

-- completion symbols
local icons = {
  Text        = { icon = ' ',  text = 'text' },
  Method      = { icon = ' ',  text = 'method' },
  Function    = { icon = ' ',  text = 'function' },
  Constructor = { icon = ' ',  text = 'constructor' },
  Field       = { icon = ' ',  text = 'field' },
  Variable    = { icon = ' ',  text = 'variable' },
  Class       = { icon = ' ',  text = 'class' },
  Interface   = { icon = ' ',  text = 'interface' },
  Module      = { icon = ' ',  text = 'module' },
  Property    = { icon = '襁 ', text = 'property' },
  Unit        = { icon = ' ',  text = 'unit' },
  Value       = { icon = ' ',  text = 'value' },
  Enum        = { icon = ' ',  text = 'enum' },
  Keyword     = { icon = ' ',  text = 'keyword' },
  Snippet     = { icon = ' ',  text = 'snippet' },
  Color       = { icon = ' ',  text = 'color' },
  File        = { icon = ' ',  text = 'file' },
  Reference   = { icon = ' ',  text = 'reference' },
  Dir         = { icon = ' ',  text = 'dir' },
  Enummember  = { icon = ' ',  text = 'enummember' },
  Constant    = { icon = ' ',  text = 'constant' },
  Struct      = { icon = ' ',  text = 'struct' },
  Event       = { icon = ' ',  text = 'event' },
  Operator    = { icon = ' ',  text = 'operator' },
  Type        = { icon = ' ',  text = 'type' },
}

local cmp_format = function(opts)
  opts = opts or {}
  local text = opts.text or false
  local icon = opts.icon or false
  return function(entry, vim_item)
    if icons[vim_item.kind] then
      vim_item.kind = string.format('%s%s',(icon and icons[vim_item.kind].icon or ''),(text and vim_item.kind or ''))
      -- vim_item.kind = (icon and icons[vim_item.kind].icon or '') .. (text and vim_item.kind or '')
      -- vim_item.kind = icons[vim_item.kind].icon .. vim_item.kind
    end

    if opts.menu ~= nil then
      vim_item.menu = opts.menu[entry.source.name]
    end

    return vim_item
  end
end

-- completion symbols
local _old_icons = {
  " [text]",     " [method]", " [function]",  " [constructor]", " [field]",
  " [variable]", " [class]",  " [interface]", " [module]",      "襁 [property]",
  " [unit]",     " [value]",  " [enum]",      " [keyword]",     " [snippet]",
  " [color]",    " [file]",   " [reference]", " [dir]",         " [enummember]",
  " [constant]", " [struct]", " [event]",     " [operator]",    " [type]",
}

local _ref_icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

return {
  cmp_format = cmp_format,
}
