-- indent_blankline.nvim configs

require('indent_blankline').setup({
  show_current_context = true,
  show_end_of_line = true,
  show_first_indent_level = false,
  indent_blankline_use_treesitter = true,
})

vim.g.indent_blankline_filetype_exclude = {
  'git',
  'help',
  'lspinfo',
  'markdown',
  'startify',
  'startuptime',
  'checkhealth',
  'packer',
  'peek',
  'alpha',
  'Outline',
  'DiffviewFiles'
}

vim.g.indent_blankline_bufname_exclude = {
  'terminal',
  'nofile'
}
