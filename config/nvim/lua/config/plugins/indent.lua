-- indent_blankline.nvim configs

local config = function()
  require('indent_blankline').setup({
    show_current_context = true,
    space_char_blankline = ' ',
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
    'lazy',
    'peek',
    'alpha',
    'Outline',
    'DiffviewFiles',
    'FTerm',
    'nfo',
    'TelescopePrompt',
    '',
  }

  vim.g.indent_blankline_bufname_exclude = {
    'terminal',
    'nofile',
    'quickfix',
    'prompt',
  }
end

return {
  'lukas-reineke/indent-blankline.nvim',
  cmd = { 'IndentBlanklineEnable', 'IndentBlanklineDisable' },
  config = config,
}
