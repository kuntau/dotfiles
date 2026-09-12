-- Leap configs

return {
  {
    'https://codeberg.org/andyg/leap.nvim',
    event = 'VeryLazy',
    config = function()
      local leap = require('leap')
      -- leap.opts.case_sensitive = true
      -- leap.opts.max_phase_one_targets = 5
      -- leap.opts.highlight_unlabeled_phase_one_targets = true

      -- Use the traversal keys to repeat the previous motion without explicitly invoking Leap:
      require('leap.user').set_repeat_keys('<tab>', '<backspace>')

      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
      vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

      -- Visit (jump - operate - jump back)
      vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-visit)')
      vim.keymap.set({ 'x', 'o' },      'ar', '<Plug>(leap-visit-text-object)')
      vim.keymap.set({ 'x', 'o' },      'ir', '<Plug>(leap-visit-inner-text-object)')

      vim.keymap.set('o', 'rr', function()  -- "visit line" shortcut
        return (vim.v.count == 0 and '1' or '') .. '<Plug>(leap-visit)'
      end, { expr = true })

      -- Automatic paste after remote yank operations:
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VisitDone',
        group = vim.api.nvim_create_augroup('Visit', {}),
        callback = function(event)
          if
            (event.data.mode:match('^[vV\22]') or (vim.v.operator == 'y'))
            and event.data.register == '"'
            then
              vim.cmd('normal! p')
            end
          end,
        })

      -- Treeselect
      vim.keymap.set({ 'x', 'o' }, 'an', function()
        require('leap.treesitter').select {
          opts = require('leap.user').with_traversal_keys('n', 'N')
        }
      end)

      vim.keymap.set({'n', 'x', 'o'}, '|', function ()
        local line = vim.fn.line('.')
        -- Skip 3-3 lines around the cursor.
        local top, bot = unpack { math.max(1, line - 3), line + 3 }
        leap.leap {
          pttern = '\\v(%<'..top..'l|%>'..bot..'l)$',
          windows = { vim.fn.win_getid() },
          opts = { safe_labels = '' }
        }
      end)

      -- Define a preview filter to reduce visual noise and the blinking effect after the first keypress (`:h leap.opts.preview`).
      -- You can still target any visible positions if needed, but you can define what is considered an exceptional case.
      -- Exclude whitespace and the middle of alphabetic words from preview:
      --   foobar[baaz] = quux
      --   ^----^^^--^^-^-^--^
      leap.opts.preview = function (ch0, ch1, ch2)
        return not (
          ch1:match('%s')
          or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
        )
      end

      -- Define equivalence classes for brackets and quotes, in addition to the default whitespace group:
      leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

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
