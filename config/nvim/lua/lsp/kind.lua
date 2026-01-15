-- LSP & cmp kind

local DONE_SETUP = false
local _dbgi = require('utils.logger').dbgi

-- completion symbols
local icons = {
  Class         = { icon = '', icon_alt = '󰠱', text = 'class'   },
  Color         = { icon = '', icon_alt = '󰏘', text = 'color'   },
  Constant      = { icon = '', icon_alt = '󰏿', text = 'const'   },
  Constructor   = { icon = '', icon_alt = '', text = 'constr'  },
  Folder        = { icon = '', icon_alt = '', text = 'dir'     },
  Enum          = { icon = '', icon_alt = '', text = 'enum'    },
  EnumMember    = { icon = '', icon_alt = '', text = 'enmbr'   },
  Event         = { icon = '', icon_alt = '󰜢', text = 'event'   },
  Field         = { icon = '⎵', icon_alt = '󰈙', text = 'field'   },
  File          = { icon = '', icon_alt = '󰉋', text = 'file'    },
  Function      = { icon = '', icon_alt = '󰊕', text = 'func'    },
  Interface     = { icon = '', icon_alt = '', text = 'iface'   },
  Keyword       = { icon = '', icon_alt = '󰌋', text = 'keyword' },
  Method        = { icon = '', icon_alt = '󰆧', text = 'method'  },
  Module        = { icon = '', icon_alt = '', text = 'module'  },
  Operator      = { icon = '', icon_alt = '󰆕', text = 'oper'    },
  Property      = { icon = '', icon_alt = '󰜢', text = 'prop'    },
  Reference     = { icon = '', icon_alt = '󰈇', text = 'ref'     },
  Snippet       = { icon = '', icon_alt = '', text = 'snip'    },
  Struct        = { icon = '', icon_alt = '󰙅', text = 'struct'  },
  Text          = { icon = '', icon_alt = '󰉿', text = 'text'    },
  TypeParameter = { icon = '', icon_alt = ' ', text = 'tparam'  },
  Unit          = { icon = '', icon_alt = '󰑭', text = 'unit'    },
  Value         = { icon = '', icon_alt = '󰎠', text = 'value'   },
  Variable      = { icon = '', icon_alt = '󰀫', text = 'var'     },
  Yank          = { icon = '󰅍', icon_alt = '󰅍', text = 'yank'    }, -- Extra for Yanky - Blink source
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

local get_icons = function(kind)
  kind = kind or '❎'
  if icons[kind] then return bracket.left .. icons[kind].icon_alt .. ' ' .. bracket.right end
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
  get = get_icons,
}
