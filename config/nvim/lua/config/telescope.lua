-- telescope configs

require('telescope').setup ({
  defaults = {
    mappings = {
      i = {
        ['jj'] = require('telescope.actions').close,
        ['<M-.>'] = require('telescope.actions.layout').toggle_preview,
        ['<M-?>'] = require('telescope.actions').which_key,
        ["<M-Up>"] = require('telescope.actions').cycle_history_prev,
        ["<M-Down>"] = require('telescope.actions').cycle_history_next,
        ['<C-u>'] = require('telescope.actions').results_scrolling_up,
        ['<C-d>'] = require('telescope.actions').results_scrolling_down,
        ['<PageUp>'] = require('telescope.actions').preview_scrolling_up,
        ['<PageDown>'] = require('telescope.actions').preview_scrolling_down,
      },
      n = {
        ['<M-.>'] = require('telescope.actions.layout').toggle_preview,
        ['<M-p>'] = require('telescope.actions.layout').cycle_layout_prev,
        ['<M-n>'] = require('telescope.actions.layout').cycle_layout_next,
        ['<C-u>'] = require('telescope.actions').results_scrolling_up,
        ['<C-d>'] = require('telescope.actions').results_scrolling_down,
        ['<PageUp>'] = require('telescope.actions').preview_scrolling_up,
        ['<PageDown>'] = require('telescope.actions').preview_scrolling_down,
      }
    },
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
      no_ignore = true,
    },
    oldfiles = {
      only_cwd = true,
    },
    buffers = {
      previewer = false,
      initial_mode = 'normal',
      sort_lastused = true,
      sort_mru = true,
      layout_config = { width = 0.4, height = 0.5 },
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
