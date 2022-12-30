-- specs configs
-- show animation on cursor jump
-- press `F5` to find cursor location

local config = function()
  require('specs').setup({
    show_jumps  = true,
    min_jump = 30,
    popup = {
      delay_ms = 10, -- delay before popup displays
      inc_ms = 15, -- time increments used for fade/resize effects 
      blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 10,
      winhl = "Todo", -- highlight to use for popup window
      fader = require('specs').pulse_fader,
      resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
      nofile = true,
    },
  })
end

return {
  'edluffy/specs.nvim',
  config = config,
  event = 'BufReadPost',
}
