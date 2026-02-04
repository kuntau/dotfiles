-- gitsigns.lua configs

return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    culhl      = false, -- Toggle with `:Gitsigns toggle_culhl`
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
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
      end

      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gs.nav_hunk('next')
        end
      end, 'Next Hunk')
      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gs.nav_hunk('prev')
        end
      end, 'Prev Hunk')
      map('n', ']H', function() gs.nav_hunk('last') end,                    'Last Hunk')
      map('n', '[H', function() gs.nav_hunk('first') end,                   'First Hunk')
      map({ 'n', 'x' }, '<leader>hs', ':Gitsigns stage_hunk<CR>',           'Stage Hunk')
      map({ 'n', 'x' }, '<leader>hr', ':Gitsigns reset_hunk<CR>',           'Reset Hunk')
      map('n', '<leader>hS', gs.stage_buffer,                               'Stage Buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk,                            'Undo Stage Hunk')
      map('n', '<leader>hR', gs.reset_buffer,                               'Reset Buffer')
      map('n', '<leader>hp', gs.preview_hunk_inline,                        'Preview Hunk Inline')
      map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame Line')
      map('n', '<leader>hB', function() gs.blame() end,                     'Blame Buffer')
      map('n', '<leader>hd', gs.diffthis,                                   'Diff This')
      map('n', '<leader>hD', function() gs.diffthis('~') end,               'Diff This ~')

      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>',             'GitSigns Select Hunk')

      map('n', '<Leader>htb', gs.toggle_current_line_blame,                'Toggle current line blame')
      map('n', '<Leader>htd', gs.toggle_deleted,                           'Toggle deleted')
      map('n', '<Leader>hts', gs.toggle_signs,                             'Toggle gutter signs')
      map('n', '<Leader>htn', gs.toggle_numhl,                             'Toggle number highlight')
      map('n', '<Leader>htl', gs.toggle_linehl,                            'Toggle line highlight')
      map('n', '<Leader>htw', gs.toggle_word_diff,                         'Toggle word diff')

    end,
  },
}
