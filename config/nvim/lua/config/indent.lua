-- indent_blankline.nvim configs

vim.g.indent_blankline_filetype_exclude = {
  'NvimTree',
  'git',
  'help',
  'lspinfo',
  'markdown',
  'vim-plug',
  'startify',
  'tex',
  'txt',
  'startuptime',
  'checkhealth',
  'packer',
}
vim.g.indent_blankline_use_treesitter = true

require("indent_blankline").setup({
  show_current_context = true,
  show_end_of_line = true,
  show_first_indent_level = false
  -- show_current_context_start = true
})
