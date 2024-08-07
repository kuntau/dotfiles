-- treesitter.lua

local config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'comment', 'css', 'html', 'javascript', 'json', 'php', 'tsx', 'typescript', 'vue' },
    sync_install = true,
    auto_install = true, -- auto install on first filetype load
    highlight = {
      enable = true,
      use_languagetree = true,
      addtional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<nop>',
        node_decremental = '<bs>',
      },
    },
    indent = {
      enable = true,
      disable = { 'python' },
    },
    refactor = {
      highlight_current_scope = {
        enable = false,
      },
      highlight_definition = {
        enable = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = 'grr',
        },
      },
      navigation = {
        enable = false,
        keymaps = {
          goto_definition = 'grd',
          list_definition = 'grD',
          list_definition_toc = 'gO',
          goto_next_usage = '<a-*>',
          goto_previos_usgae = '<a-#>',
        },
      },
    },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['al'] = '@call.outer',
          ['il'] = '@call.inner',
          ['uc'] = '@comment.outer', -- <-- This one does the magic
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']]'] = '@function.outer',
          [']m'] = '@class.outer',
        },
        goto_next_end = {
          [']['] = '@function.outer',
          [']M'] = '@class.outer',
        },
        goto_previous_start = {
          ['[['] = '@function.outer',
          ['[m'] = '@class.outer',
        },
        goto_previous_end = {
          ['[]'] = '@function.outer',
          ['[M'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = { ['gra'] = '@parameter.inner' },
        swap_previous = { ['grA'] = '@parameter.inner' },
      },
      lsp_interop = {
        enable = true,
        border = 'single',
        peek_definition_code = {
          ['grf'] = '@function.outer',
          ['grF'] = '@class.outer',
        },
      },
    },
    textsubjects = {
      enable = true,
      prev_selection = ',',
      keymaps = {
        ['.'] = 'textsubjects-smart', -- this keymaps only work in visual mode
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
    autotag = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      query = 'rainbow-parens', -- Which query to use for finding delimiters
      -- strategy = require 'ts-rainbow.strategy.global', -- Highlight the entire buffer all at once
      max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    },
  })
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor', -- Refactor module for treesitter
      'nvim-treesitter/nvim-treesitter-textobjects', -- Syntax aware text-objects, select, move, swap
      'RRethy/nvim-treesitter-textsubjects', -- Location and syntax aware text objects
      { 'nvim-treesitter/nvim-treesitter-context', config = true }, -- Show code context
    },
    event = 'BufReadPost',
    config = config,
    build = ':TSUpdate', -- We recommend updating the parsers cmd update
  },
  { 'chrisgrieser/nvim-various-textobjs',
    name = 'various-textobjs',
    opts = { useDefaultKeymaps = true },
    event = 'ModeChanged',
  },
  { 'windwp/nvim-ts-autotag', ft = { 'markdown', 'vue', 'html', 'jsx', 'tsx' } }, -- auto complete HTML tags
  { 'abecodes/tabout.nvim', config = true, event = 'InsertEnter *.*' }, -- TS - easy exit in params
  { 'https://gitlab.com/HiPhish/nvim-ts-rainbow2.git' }, -- TS powered rainbow brackets
}
