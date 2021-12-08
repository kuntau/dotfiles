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
  rainbow = {
    enable = true,
    extended_mode = true,
  }
})
