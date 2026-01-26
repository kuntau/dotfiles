-- treesitter.lua

local option_modules = {
  ensure_installed = { 'comment', 'regex', 'javascript', 'json', 'php', 'typescript', },
  sync_install = true,
  auto_install = true, -- auto install on first filetype load
  highlight = {
    enable = true,
    disable = false,
    use_languagetree = true,
    addtional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    disable = false,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'gna',
      scope_incremental = 'gns',
      node_decremental = 'gnd',
    },
  },
  indent = {
    enable = true,
    disable = false,
    -- disable = { 'python' },
  },
}

local config_textobjects = function()
  -- configuration
  require('nvim-treesitter-textobjects').setup {
    select = {
      lookahead = true,
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = false,
    },
    move = {
      -- whether to set jumps in the jumplist
      set_jumps = true,
    },
  }

  -- keymaps
  -- You can use the capture groups defined in `textobjects.scm`
  vim.keymap.set({ 'x', 'o' }, 'am', function()
    require 'nvim-treesitter-textobjects.select'.select_textobject('@function.outer', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'im', function()
    require 'nvim-treesitter-textobjects.select'.select_textobject('@function.inner', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'ac', function()
    require 'nvim-treesitter-textobjects.select'.select_textobject('@class.outer', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'ic', function()
    require 'nvim-treesitter-textobjects.select'.select_textobject('@class.inner', 'textobjects')
  end)
  -- You can also use captures from other query groups like `locals.scm`
  vim.keymap.set({ 'x', 'o' }, 'as', function()
    require 'nvim-treesitter-textobjects.select'.select_textobject('@local.scope', 'locals')
  end)

  -- TS Move
  -- You can use the capture groups defined in `textobjects.scm`
  vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
  end)
  -- vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
  --   require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
  -- end)
  -- You can also pass a list to group multiple queries.
  vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
    require('nvim-treesitter-textobjects.move').goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
  end)
  -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
  vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
    require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
  end)

  vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
    require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
  end)

  vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
    require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
  end)
  -- vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
  --   require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
  -- end)

  vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
    require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
  end)

  -- Go to either the start or the end, whichever is closer.
  -- Use if you want more granular movements
  vim.keymap.set({ 'n', 'x', 'o' }, ']d', function()
    require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
  end)
  vim.keymap.set({ 'n', 'x', 'o' }, '[d', function()
    require('nvim-treesitter-textobjects.move').goto_previous('@conditional.outer', 'textobjects')
  end)

  -- TS Swap
  vim.keymap.set('n', '<leader>a', function()
    require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
  end)
  vim.keymap.set('n', '<leader>A', function()
    require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.outer'
  end)

  -- TS Repeatable
  local ts_repeat_move = require('nvim-treesitter-textobjects.repeatable_move')

  -- Repeat movement with ; and ,
  -- ensure ; goes forward and , goes backward regardless of the last direction
  vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
  vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

  -- vim way: ; goes to the direction you were moving.
  -- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
  -- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
  vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

  -- This repeats the last query with always previous direction and to the start of the range.
  vim.keymap.set({ "n", "x", "o" }, "<home>", function()
    ts_repeat_move.repeat_last_move({ forward = false, start = true })
  end)

  -- This repeats the last query with always next direction and to the end of the range.
  vim.keymap.set({ "n", "x", "o" }, "<end>", function()
    ts_repeat_move.repeat_last_move({ forward = true, start = false })
  end)
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = 'VeryLazy',
    -- config = config_modules,
    build = ':TSUpdate', -- We recommend updating the parsers cmd update
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main', config = config_textobjects }, -- Syntax aware text-objects, select, move, swap
      { 'nvim-treesitter/nvim-treesitter-context', config = true }, -- Show code context
      { 'https://github.com/MeanderingProgrammer/treesitter-modules.nvim', opts = option_modules }, -- Replace the original modules in *master*
      -- 'nvim-treesitter/nvim-treesitter-locals', -- nvim-treesitter-refactor successor
      -- 'RRethy/nvim-treesitter-textsubjects', -- Location and syntax aware text objects
      {
        'chrisgrieser/nvim-various-textobjs',
        name = 'various-textobjs',
        event = 'ModeChanged',
        opts = { keymaps = { useDefaults = true, disabledDefaults = { 'r' } } },
      },
      {
        'abecodes/tabout.nvim',
        event = 'InsertEnter *.*',
        config = true,
      }, -- TS - easy exit in params
      { 'windwp/nvim-ts-autotag', ft = { 'markdown', 'vue', 'html', 'jsx', 'tsx' } }, -- auto complete HTML tags
      { 'HiPhish/rainbow-delimiters.nvim' }, -- TS powered rainbow brackets
    },
  },
}
