-- telescope configs

local trouble = require('trouble.providers.telescope')
require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

require('telescope').setup ({
  defaults = {
    mappings = {
      i = {
        -- ['<ESC>'] = require('telescope.actions').close,
        ['<c-t>'] = trouble.open_with_trouble,
      },
    },
    layout_strategy      = 'flex',
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
