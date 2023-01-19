-- configs for Comment.nvim
-- Comment plugins with treesitter support

local config = function()
  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

return {
  'numToStr/Comment.nvim',
  keys = {
    { 'gb', desc = 'Toggle comment block' },
    { 'gc', desc = 'Toggle comment line' },
    { 'gc', desc = 'Toggle comment line', mode='v' },
  },
  dependencies = 'JoosepAlviste/nvim-ts-context-commentstring', -- context-commentstring module for treesitter
  config = config,
}
