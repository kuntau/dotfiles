return {
  'monaqa/dial.nvim',
  keys =  {
      { '<C-a>', '<Plug>(dial-increment)', mode = {'n','v'}, desc = 'Increment (Dial)' },
      { '<C-x>', '<Plug>(dial-decrement)', mode = {'n','v'}, desc = 'Decrement (Dial)' },
      { 'g<C-a>', 'g<Plug>(dial-increment)', desc = 'Increment (Dial)' },
      { 'g<C-x>', 'g<Plug>(dial-decrement)', desc = 'Decrement (Dial)' },
      { '<Leader><C-a>', '"=extra<CR><Plug>(dial-increment)', mode = {'n','v'}, desc = 'Increment (Dial+)' },
      { '<Leader><C-x>', '"=extra<CR><Plug>(dial-decrement)', mode = {'n','v'}, desc = 'Decrement (Dial+)' },
    },
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.binary,
        augend.integer.alias.hex,
        augend.integer.alias.octal,
        augend.date.alias['%d/%m/%Y'],
        augend.constant.alias.bool,
      },
      extra = {
        augend.semver.alias.semver,
        augend.misc.alias.markdown_header,
        augend.paren.alias.quote,
        augend.paren.alias.brackets,
        augend.paren.alias.lua_str_literal,
        augend.constant.new({
          elements = { 'and', 'or' },
          word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
          cyclic = true, -- "or" is incremented into "and".
        }),
        augend.constant.new({
          elements = { 'yes', 'no' },
          word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
          cyclic = true, -- "or" is incremented into "and".
        }),
        augend.constant.new({
          elements = { '&&', '||' },
          word = false,
          cyclic = true,
        }),
        augend.hexcolor.new({
          case = 'lower',
        }),
        augend.case.new({
          types = { 'camelCase', 'snake_case' },
          cyclic = true,
        }),
      },
    })
  end,
}
