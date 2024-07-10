-- gitsigns.lua configs
-- Gutter git signs

local config = function()
  require('gitsigns').setup({
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      local wk = require('which-key')
      local gs = package.loaded.gitsigns

      -- Ref: https://www.reddit.com/r/neovim/comments/vlc9sc/how_to_define_a_user_command_to_partially_stage/
      -- https://github.com/andrewferrier/dotfiles/blob/919719a153d34393b787e4c0a394de56e764004a/common/.config/nvim/lua/plugins/gitsigns.lua#L3
      -- https://github.com/b0o/nvim-conf/blob/839b0f92e8a2a94b7a218e978da4e2d7f69d8cd7/lua/user/mappings.lua#L716
      local visual_stage = function()
        local feedkey = vim.api.nvim_feedkeys
        local rtc = vim.api.nvim_replace_termcodes
        local first_line = vim.fn.line('v')
        local last_line = vim.fn.getpos('.')[2]
        gs.stage_hunk({ first_line, last_line })
        feedkey(rtc('<Esc>', true, false, true), 't', false)
      end

      wk.register({
        [']c'] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", 'Next hunk', expr = true },
        ['[c'] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", 'Previous hunk', expr = true },
        ['<Leader>h'] = {
          name = 'GitSigns',
          s = { gs.stage_hunk, 'Stage hunk', mode = { 'n', 'v' } },
          r = { gs.reset_hunk, 'Reset hunk', mode = { 'n', 'v' } },
          S = { gs.stage_buffer, 'Stage buffer' },
          u = { gs.undo_stage_hunk, 'Undo stage hunk' },
          R = { gs.reset_buffer, 'Reset buffer' },
          p = { gs.preview_hunk, 'Preview hunk' },
          d = { gs.diffthis, 'Diff this' },
          D = { function() gs.diffthis('~') end, 'Diff this' },
          b = { function() gs.blame_line({ full = true }) end, 'Git blame full' },
        },
        ['<Leader>ht'] = {
          name = 'Toggle',
          b = { gs.toggle_current_line_blame, 'Toggle current line blame' },
          d = { gs.toggle_deleted, 'Toggle deleted' },
          n = { gs.toggle_numhl, 'Toggle number highlight' },
          s = { gs.toggle_signs, 'Toggle gutter signs' },
          w = { gs.toggle_word_diff, 'Toggle word diff' },
          l = { gs.toggle_linehl, 'Toggle line highlight' },
        },
        ih = { '<cmd>Gitsigns select_hunk<cr>', 'Select hunk', mode = { 'x', 'o' } },
      }, { buffer = bufnr })
    end,
  })
end

return {
  'lewis6991/gitsigns.nvim',
  config = config,
  event = 'VeryLazy',
}
