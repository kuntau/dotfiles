-- telescope configs

local action = require('telescope.actions')
local trouble = require('trouble.providers.telescope')

require('telescope').setup ({
  defaults = {
    mappings = {
      i = {
        ['<ESC>'] = action.close,
        ['<c-t>'] = trouble.open_with_trouble,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position    = "top",
    prompt_prefix      = "> ",
    selection_caret    = "> ",
    entry_prefix       = "  ",
    initial_mode       = "insert",
    selection_strategy = "reset",
    sorting_strategy   = "descending",
    layout_strategy    = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter          = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter       = require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path         = true,
    winblend             = 0,
    width                = 0.75,
    preview_cutoff       = 120,
    results_height       = 1,
    results_width        = 0.8,
    border               = {},
    borderchars          = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons       = true,
    use_less             = true,
    set_env              = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer       = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer       = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer     = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
})

vim.api.nvim_set_keymap('n', '<Leader>ob', ':Telescope buffers show_all_buffers=true sort_lastused=true<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>of', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>og', ':Telescope git_files<CR>', {})
-- vim.api.nvim_set_keymap('n', '<Leader>', ':Telescope <CR>', {})