-- treesitter.lua

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    use_languagetree= true,
    addtional_vim_regex_highlighting = false,
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
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
})
