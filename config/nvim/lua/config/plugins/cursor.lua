-- specs configs
-- show animation on cursor jump
-- press `F5` to find cursor location

local config = function()
  require('specs').setup({
    show_jumps  = true,
    min_jump = 30,
    popup = {
      delay_ms = 5, -- delay before popup displays
      inc_ms = 10, -- time increments used for fade/resize effects 
      blend = 50, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 5,
      winhl = "Cursor", -- highlight to use for popup window
      fader = require('specs').exp_fader,
      resizer = require('specs').shrink_resizer
    },
    -- ignore_filetypes = {},
    ignore_buftypes = {
      nofile = true,
    },
  })
end

return {
  'edluffy/specs.nvim',
  config = config,
  enabled = false,
  event = 'WinNew',
}
