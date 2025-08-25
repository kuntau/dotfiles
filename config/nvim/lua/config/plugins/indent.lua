-- indent_blankline.nvim configs

local config = function()
  require('ibl').setup({
    enabled = true,
    indent = { char = "│" },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = {
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        'DiffviewFiles',
        'FTerm',
        'Outline',
        'TelescopePrompt',
        'TelescopeResults',
        'alpha',
        'checkhealth',
        'git',
        'gitcommit',
        'help',
        'lazy',
        'lspinfo',
        'man',
        'markdown',
        'nfo',
        'peek',
        'startify',
        'startuptime',
        '',
      },
      buftypes = {
        'terminal',
        'nofile',
        'quickfix',
        'prompt',
      }
    }
  })
end

return {
  'lukas-reineke/indent-blankline.nvim',
  cmd = { 'IBLEnable', 'IBLDisable' },
  main = 'ibl',
  opts = {},
  config = config,
  enabled = false
}
