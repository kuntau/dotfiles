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

      wk.add({
        { "<Leader>h", group = "GitSigns" },
        -- Navigation
        { "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", desc = "next hunk", expr = true, replace_keycodes = false },
        { "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", desc = "previous hunk", expr = true, replace_keycodes = false },
        { "<Leader>hs", gs.stage_hunk, desc = "Stage hunk" },
        { "<Leader>hr", gs.reset_hunk, desc = "Reset hunk" },
        { "<Leader>hs", function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, desc = "Stage hunk", mode = "v" },
        { "<Leader>hr", function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, desc = "Reset hunk", mode = "v" },
        { "<Leader>hS", gs.stage_buffer, desc = "Stage buffer" },
        { "<Leader>hu", gs.undo_stage_hunk, desc = "Undo stage hunk" },
        { "<Leader>hR", gs.reset_buffer, desc = "Reset buffer" },
        { "<Leader>hp", gs.preview_hunk, desc = "Preview hunk" },
        { "<Leader>hd", gs.diffthis, desc = "Diff this" },
        { "<Leader>hD", function() gs.diffthis('~') end, desc = "Diff this" },
        { "<Leader>hb", function() gs.blame_line({ full = true }) end, desc = "Git blame full" },

        { "<Leader>ht", group = "Toggle" },
        { "<Leader>htb", gs.tooggle_current_line_blame, desc = "Toggle current line blame" },
        { "<Leader>htd", gs.tooggle_deleted, desc = "Toggle deleted" },
        { "<Leader>hts", gs.tooggle_signs, desc = "Toggle gutter signs" },
        { "<Leader>htn", gs.tooggle_numhl, desc = "Toggle number highlight" },
        { "<Leader>htl", gs.tooggle_linehl, desc = "Toggle line highlight" },
        { "<Leader>htw", gs.tooggle_word_diff, desc = "Toggle word diff" },

        { "ih", "<cmd>Gitsigns select_hunk<cr>", desc = "Select hunk", mode = { "o", "x" } },

      }, { buffer = bufnr })
    end,
  })
end

return {
  'lewis6991/gitsigns.nvim',
  config = config,
  event = 'VeryLazy',
}
