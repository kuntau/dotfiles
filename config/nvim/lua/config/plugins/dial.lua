return {
  'monaqa/dial.nvim',
  keys = { '<c-a>', '<c-x>' },
  config = function()
    local augend = require('dial.augend')
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
        augend.constant.alias.bool,
        augend.semver.alias.semver,
      },
    })

    vim.keymap.set('n', '<C-a>', require('dial.map').inc_normal(), { noremap = true, desc = "Dial: Increment" })
    vim.keymap.set('n', '<C-x>', require('dial.map').dec_normal(), { noremap = true, desc = "Dial: Decrement" })
    vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual(), { noremap = true, desc = "Dial: Increment" })
    vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual(), { noremap = true, desc = "Dial: Decrement" })
    vim.keymap.set('v', 'g<C-a>', require('dial.map').inc_gvisual(), { noremap = true, desc = "Dial: Increment" })
    vim.keymap.set('v', 'g<C-x>', require('dial.map').dec_gvisual(), { noremap = true, desc = "Dial: Decrement" })
  end
}
