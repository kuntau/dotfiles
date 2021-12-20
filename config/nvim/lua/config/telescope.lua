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
    path_display         = { 'smart' },
    selection_strategy   = 'closest',
    sorting_strategy     = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top'
      },
      vertical = {
        prompt_position = 'top'
      },
    },
    pickers = {
      git_bcommits = {
        initial_mode = 'normal'
      },
      colorscheme = {
        initial_mode = 'normal',
        enable_preview = true,
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      }
    },
  }
})
