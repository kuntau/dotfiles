-- telescope and it's extensions configs

local config = function() require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
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
        ['q'] = require('telescope.actions').close,
        ['D'] = require('telescope.actions').delete_buffer,
        ['<M-.>'] = require('telescope.actions.layout').toggle_preview,
        ['<M-p>'] = require('telescope.actions.layout').cycle_layout_prev,
        ['<M-n>'] = require('telescope.actions.layout').cycle_layout_next,
        ['<C-u>'] = require('telescope.actions').results_scrolling_up,
        ['<C-d>'] = require('telescope.actions').results_scrolling_down,
        ['<PageUp>'] = require('telescope.actions').preview_scrolling_up,
        ['<PageDown>'] = require('telescope.actions').preview_scrolling_down,
      }
    },
    file_ignore_patterns = { '^node_modules/', '^.git/', '^vendor/' },
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
      previewer = false,
      no_ignore = true,
      follow = true,
      hidden = true,
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
  extensions = {
    project = {
      base_dirs = {
        -- { '~/coding', max_depth = 2 },
        -- { '~/coding/forks', max_depth = 2 }
      }
    }
  }
})
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzy-native.nvim',
        enabled = false,
        config = function() require('telescope').load_extension('fzy_native') end,
        build = 'cd "deps/fzy-lua-native" && make',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- enabled = false,
        config = function() require('telescope').load_extension('fzf') end,
        build = 'make',
      },
    },
    dev = false,
    cmd = 'Telescope',
    config = config,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function() require('telescope').load_extension('frecency') end,
    dependencies = 'tami5/sqlite.lua',
  },
  {
    'nvim-telescope/telescope-project.nvim',
    config = function()
      require('telescope').load_extension('project')
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('telescope').load_extension('projects')
      require('project_nvim').setup()
    end,
    -- init = function() require('project_nvim').setup() end
  },
}