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
    current_line_blame_formatter_opts = {
      relative_time = true,
    },
    on_attach = function(bufnr)
      local wk = require('which-key')
      local gs = package.loaded.gitsigns

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
