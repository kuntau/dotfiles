-- All about the YANK. So far Yanky is the best

local config = function()
  local wk = require('which-key')

  wk.add({
    -- Show yank history with Snacks.picker
    { '""',  function() Snacks.picker.yanky() end, desc = "Open yanky history" },
    -- Yank-ring
    { "<A-n>", "<Plug>(YankyCycleForward)", desc = "YankRing cycle forward" },
    { "<A-p>", "<Plug>(YankyCycleBackward)", desc = "YankRing cycle backward" },
    -- unimpaired like, don't need this if we have vim-unimpaired
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Yanky PutIndent before Linewise" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Yanky PutIndent before Linewise" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Yanky PutIndent after Linewise" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Yanky PutIndent after Linewise" },
    -- paste with indent
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Yanky PutIndent before shift left" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Yanky PutIndent after shift left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Yanky PutIndent before shift right" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Yanky PutIndent after shift right" },
    {
      mode = { "n", "x" },
      -- restore cursor after yank
      { "y", "<Plug>(YankyYank)", desc = "Yank & restore cursor" },
      -- Standard pasting
      { "p", "<Plug>(YankyPutAfter)", desc = "Yanky Put After" },
      { "P", "<Plug>(YankyPutBefore)", desc = "Yanky Put Before" },
      { "gp", "<Plug>(YankyGPutAfter)", desc = "Yanky GPut After" },
      { "gP", "<Plug>(YankyGPutBefore)", desc = "Yanky GPut Before" },
      -- Special
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Yanky Put After" },
      { "=gP", "<Plug>(YankyGPutBeforeFilter)", desc = "Yanky Put After" },
      { "=gp", "<Plug>(YankyGPutAfterFilter)", desc = "Yanky Put After" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Yanky Put After" },
    },
  })

  require('yanky').setup({
    ring = { storage = 'sqlite' },
  })
end

return {
  {
    'gbprod/yanky.nvim',
    event = 'VeryLazy',
    config = config,
  },
}
