-- All about the YANK. So far Yanky is the best

local init = function()
  vim.keymap.set('n', [[""]], function() require('telescope').extensions.yank_history.yank_history() end)

  -- restore cursor after yank
  vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)') -- restore cursor after yank

  -- Standard pasting
  vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
  vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
  vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
  vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

  -- Yank-ring
  vim.keymap.set('n', '<A-n>', '<Plug>(YankyCycleForward)')
  vim.keymap.set('n', '<A-p>', '<Plug>(YankyCycleBackward)')

  -- unimpaired like, don't need this if we have vim-unimpaired
  vim.keymap.set('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
  vim.keymap.set('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
  vim.keymap.set('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
  vim.keymap.set('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')

  vim.keymap.set('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
  vim.keymap.set('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
  vim.keymap.set('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
  vim.keymap.set('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')

  -- Special
  vim.keymap.set({ 'n', 'x' }, '=p', '<Plug>(YankyPutAfterFilter)')
  vim.keymap.set({ 'n', 'x' }, '=P', '<Plug>(YankyPutBeforeFilter)')
  vim.keymap.set({ 'n', 'x' }, '=gp', '<Plug>(YankyGPutAfterFilter)')
  vim.keymap.set({ 'n', 'x' }, '=gP', '<Plug>(YankyGPutBeforeFilter)')
end

local config = function()
  local utils = require('yanky.utils')
  local mapping = require('yanky.telescope.mapping')

  require('telescope').load_extension('yank_history')
  require('yanky').setup({
    ring = { storage = 'sqlite' },
    picker = {
      telescope = {
        mappings = {
          default = mapping.put('p'),
          i = {
            ['<cr>'] = mapping.put('p'),
            ['<s-cr>'] = mapping.put('P'),
            ['<c-x>'] = mapping.delete(),
            ['<c-r>'] = mapping.set_register(utils.get_default_register()),
          },
          n = {
            p = mapping.put('p'),
            P = mapping.put('P'),
            d = mapping.delete(),
            r = mapping.set_register(utils.get_default_register()),
          },
        },
      },
    },
  })
end

return {
  {
    'gbprod/yanky.nvim',
    init = init,
    event = 'BufReadPost',
    config = config,
  },
}
