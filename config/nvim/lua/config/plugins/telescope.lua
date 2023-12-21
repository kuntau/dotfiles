-- telescope and it's extensions configs

local config = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local layout = require('telescope.actions.layout')

  local stopinsert = function(callback)
    return function(prompt_bufnr)
      vim.cmd.stopinsert()
      vim.schedule(function() callback(prompt_bufnr) end)
    end
  end

  telescope.setup({
    defaults = {
      prompt_prefix = ' ',
      -- selection_caret = '>>',
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
          ['jj'] = actions.close,
          ['<M-.>'] = layout.toggle_preview,
          ['<M-?>'] = actions.which_key,
          ['<M-Up>'] = actions.cycle_history_prev,
          ['<M-Down>'] = actions.cycle_history_next,
          ['<C-u>'] = actions.results_scrolling_up,
          ['<C-d>'] = actions.results_scrolling_down,
          ['<PageUp>'] = actions.preview_scrolling_up,
          ['<PageDown>'] = actions.preview_scrolling_down,
          ['<CR>'] = stopinsert(actions.select_default),
          ['<C-x>'] = stopinsert(actions.select_horizontal),
          ['<C-v>'] = stopinsert(actions.select_vertical),
          ['<C-t>'] = stopinsert(actions.select_tab),
        },
        n = {
          ['q'] = actions.close,
          ['D'] = actions.delete_buffer,
          ['<M-.>'] = layout.toggle_preview,
          ['<M-p>'] = layout.cycle_layout_prev,
          ['<M-n>'] = layout.cycle_layout_next,
          ['<C-u>'] = actions.results_scrolling_up,
          ['<C-d>'] = actions.results_scrolling_down,
          ['<PageUp>'] = actions.preview_scrolling_up,
          ['<PageDown>'] = actions.preview_scrolling_down,
        },
      },
      -- file_ignore_patterns = { '^node_modules/', '^.git/' },
      layout_strategy = (require('utils').get_win_orientation)(),
      path_display = { 'truncate' },
      selection_strategy = 'closest',
      sorting_strategy = 'ascending',
      -- layout_strategy      = 'bottom_pane',
      -- dynamic_preview_title= true,
      layout_config = {
        horizontal = { prompt_position = 'top' },
        vertical = { prompt_position = 'top' },
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
        initial_mode = 'normal',
        only_cwd = true,
      },
      buffers = {
        initial_mode = 'normal',
        previewer = false,
        sort_lastused = true,
        sort_mru = true,
        layout_config = { width = 0.4, height = 0.5 },
      },
      colorscheme = {
        initial_mode = 'normal',
        theme = 'ivy',
        enable_preview = true,
      },
    },
    extensions = {
      smart_open = {
        show_scores = true,
        max_unindexed = 1000,
        match_algorithm = 'fzf',
      },
      frecency = {
        previewer = false,
        show_scores = true,
      },
    },
  })
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        config = function() require('telescope').load_extension('fzf') end,
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
    },
    dev = false,
    cmd = 'Telescope',
    config = config,
  },
  {
    'danielfalk/smart-open.nvim',
    config = function() require('telescope').load_extension('smart_open') end,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function() require('telescope').load_extension('frecency') end,
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
