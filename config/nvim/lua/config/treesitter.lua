-- treesitter.lua

-- TODO: investigate how to set this in lua
-- RESULT: Yep, we're overthinking it.. just set as literal string LOL
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'bash', 'cmake', 'comment', 'cpp', 'css', 'dart', 'dockerfile', 'go', 'graphql', 'html', 'javascript', 'json', 'jsonc', 'lua', 'php', 'python', 'regex', 'ruby', 'scss', 'svelte', 'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml' },
  sync_install = true,
  highlight = {
    enable = true,
    use_languagetree= true,
    addtional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },
  indent = {
    enable = true,
  },
  refactor = {
    highlight_current_scope = {
      enable = false
    },
    highlight_definition = {
      enable = true
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'gtr'
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definition = 'gnD',
        list_definition_toc = 'gO',
        goto_next_usage = '<a-*>',
        goto_previos_usgae = '<a-#>'
      }
    }
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
  matchup = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
})