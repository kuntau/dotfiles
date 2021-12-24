-- telescope configs

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

require('telescope').setup ({
  defaults = {
    mappings = {
      i = {
        -- ['<ESC>'] = require('telescope.actions').close,
      },
    },
    file_ignore_patterns = { 'node_modules', '.git' },
    layout_strategy      = require("utils").getWinOrientation(),
    file_ignore_patterns = { '^node_modules/', '^.git/' },
    layout_strategy      = (require("utils").getWinOrientation)(),
    path_display         = { 'smart' },
    selection_strategy   = 'closest',
    sorting_strategy     = 'ascending',
    -- layout_strategy      = 'bottom_pane',
    -- dynamic_preview_title= true,
    layout_config = {
      horizontal = {
        prompt_position = 'top',
      },
      vertical = {
        prompt_position = 'top',
      },
    },
  },
  pickers = {
    builtin = {
      previewer = false,
      layout_config = { width = 0.5 },
    },
    find_files = {
    },
    buffers = {
      theme = 'ivy',
      previewer = false,
      initial_mode = 'normal',
      sort_lastused = true,
      sort_mru = true,
      -- ignore_current_buffer = true,
    },
    git_bcommits = {
      initial_mode = 'normal'
    },
    colorscheme = {
      theme = 'ivy',
      -- previewer = false,
      initial_mode = 'normal',
      enable_preview = true,
    }
  },
  extensions = {}
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
