return {
  {
  'ggandor/leap.nvim',
  keys = { 's', 'S' },
  config = function()
    local leap = require('leap')
    leap.setup({})
    leap.leap({ target_windows = { vim.fn.win_getid() } })
    leap.add_default_mappings()
  end,
  },
  {
    'ggandor/flit.nvim',
    keys = { 'f', 'F', 't', 'T' },
    config = { multiline = false }
  }
}


--[[ init = function()
  -- The below settings make Leap's highlighting a bit closer to what you've been used to in Lightspeed.
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = 'white',  -- for light themes, set to 'black' or similar
    bold = true,
    nocombine = true,
  })
  require('leap').opts.highlight_unlabeled_phase_one_targets = true
end, ]]
