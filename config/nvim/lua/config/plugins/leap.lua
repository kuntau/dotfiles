-- FIXME: Leap can't set it's key whenever we load Startify on startup
-- possibly because startify also map the `s` key
return {
  {
    'ggandor/leap.nvim',
    event = 'BufReadPost',
    config = function()
      local leap = require('leap')
      leap.add_default_mappings()
      leap.opts.case_sensitive = true
      leap.opts.max_phase_one_targets = 5
      leap.opts.highlight_unlabeled_phase_one_targets = true
      leap.opts.preview_filter = function (ch0, ch1, ch2)
        return not (
          ch1:match('%s') or
          ch0:match('%w') and ch1:match('%w') and ch2:match('%w')
        )
      end

      -- vim.api.nvim_create_autocmd('ColorScheme', {
      --   callback = function ()
      --     vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'black', bg = 'white', bold = true })
      --     vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'white', bg = 'red' })
      --     vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'black', bg = 'white' })
      --     -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      --   end
      -- })
    end,
  },
}
