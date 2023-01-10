-- telescope and it's extensions configs

local config = function()
  require('telescope').setup({
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
          ['<M-Up>'] = require('telescope.actions').cycle_history_prev,
          ['<M-Down>'] = require('telescope.actions').cycle_history_next,
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
        },
      },
      -- file_ignore_patterns = { '^node_modules/', '^.git/' },
      layout_strategy = (require('utils').getWinOrientation)(),
      path_display = { 'truncate' },
      selection_strategy = 'closest',
      sorting_strategy = 'ascending',
      initial_mode = 'normal',
      -- layout_strategy      = 'bottom_pane',
      -- dynamic_preview_title= true,
      layout_config = {
        horizontal = { prompt_position = 'top', },
        vertical = { prompt_position = 'top', },
      },
      history = {
        path = vim.fn.stdpath('data') .. '/databases/telescope_history.db',
        limit = 100,
      },
    },
    pickers = {
      builtin = {
        previewer = false,
        layout_config = { width = 0.5 },
      },
      fd = { initial_mode = 'insert', },
      find_files = {
        initial_mode = 'insert',
        previewer = false,
        no_ignore = true,
        follow = true,
        hidden = true,
      },
      live_grep = { initial_mode = 'insert' },
      oldfiles = {
        only_cwd = true,
      },
      buffers = {
        previewer = false,
        sort_lastused = true,
        sort_mru = true,
        layout_config = { width = 0.4, height = 0.5 },
      },
      colorscheme = {
        theme = 'ivy',
        enable_preview = true,
      },
    },
    extensions = {
      frecency = {
        initial_mode = 'insert',
        enable_preview = false,
        require('telescope.themes').get_dropdown({
          theme = 'ivy',
          layout_config = { width = 0.4, height = 0.5 },
        }),
      },
      projects = {
        require('telescope.themes').get_dropdown({
          layout_config = { width = 0.4, height = 0.5 },
        }),
      },
      project = {
        require('telescope.themes').get_dropdown({
          layout_config = { width = 0.4, height = 0.5 },
        }),
        base_dirs = {
          -- { '~/coding', max_depth = 2 },
          -- { '~/coding/forks', max_depth = 2 }
        },
      },
      ['ui-select'] = {
        require('telescope.themes').get_dropdown({
          layout_config = { width = 0.4, height = 0.5 },
        }),
      },
    },
  })
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        config = function() require('telescope').load_extension('fzf') end,
        build = 'make',
      },
      {
        'nvim-telescope/telescope-smart-history.nvim',
        config = function() require('telescope').load_extension('smart_history') end,
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
    'nvim-telescope/telescope-ui-select.nvim',
    event = 'VeryLazy',
    config = function() require('telescope').load_extension('ui-select') end,
  },
  {
    'nvim-telescope/telescope-project.nvim',
    config = function() require('telescope').load_extension('project') end,
  },
  {
    'ahmedkhalf/project.nvim',
    -- init = function() require('project_nvim').setup() end,
    config = function()
      require('project_nvim').setup()
      require('telescope').load_extension('projects')
    end,
  },
}
