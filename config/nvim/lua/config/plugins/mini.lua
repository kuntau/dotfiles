return {
  {
    'echasnovski/mini.surround',
    keys = 'S',
    enabled = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'Sa', -- Add surrounding in Normal and Visual modes
          delete = 'Sd', -- Delete surrounding
          find = 'Sf', -- Find surrounding (to the right)
          find_left = 'SF', -- Find surrounding (to the left)
          highlight = 'Sh', -- Highlight surrounding
          replace = 'Sr', -- Replace surrounding
          update_n_lines = 'Sn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        }
      })
    end
  },
  {
    'echasnovski/mini.starter',
    config = function()
      local starter = require('mini.starter')
      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(10, false),
          starter.sections.recent_files(10, true),
          -- Use this if you set up 'mini.sessions'
          starter.sections.sessions(5, true)
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('all', { 'Builtin actions' }),
          starter.gen_hook.padding(3, 2),
        },
      })
    end
  },
  {
    'echasnovski/mini.animate',
    config = function() require('mini.animate').setup() end,
    -- event = "BufReadPost"
  }
}
