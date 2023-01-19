-- All about the YANK. So far Yanky is the best

local config = function()
  local utils = require('yanky.utils')
  local mapping = require('yanky.telescope.mapping')
  local wk = require('which-key')

  wk.register({
    ['""'] = { function() require('telescope').extensions.yank_history.yank_history() end, 'Open yanky history' },

    -- restore cursor after yank
    ['y'] = { '<Plug>(YankyYank)', 'Yank & restore cursor', mode = { 'n', 'x' } },

    -- Standard pasting
    ['p'] =  { '<Plug>(YankyPutAfter)',   'Yanky Put After',   mode = { 'n', 'x' } },
    ['P'] =  { '<Plug>(YankyPutBefore)',  'Yanky Put Before',  mode = { 'n', 'x' } },
    ['gp'] = { '<Plug>(YankyGPutAfter)',  'Yanky GPut After',  mode = { 'n', 'x' } },
    ['gP'] = { '<Plug>(YankyGPutBefore)', 'Yanky GPut Before', mode = { 'n', 'x' } },

    -- Yank-ring
    ['<A-n>'] = { '<Plug>(YankyCycleForward)',  'YankRing cycle forward' },
    ['<A-p>'] = { '<Plug>(YankyCycleBackward)', 'YankRing cycle backward' },

    -- unimpaired like, don't need this if we have vim-unimpaired
    [']p'] = { '<Plug>(YankyPutIndentAfterLinewise)',  'Yanky PutIndent after Linewise' },
    ['[p'] = { '<Plug>(YankyPutIndentBeforeLinewise)', 'Yanky PutIndent before Linewise' },
    [']P'] = { '<Plug>(YankyPutIndentAfterLinewise)',  'Yanky PutIndent after Linewise' },
    ['[P'] = { '<Plug>(YankyPutIndentBeforeLinewise)', 'Yanky PutIndent before Linewise' },

    ['>p'] = { '<Plug>(YankyPutIndentAfterShiftRight)',  'Yanky PutIndent after shift right' },
    ['<p'] = { '<Plug>(YankyPutIndentAfterShiftLeft)',   'Yanky PutIndent after shift left' },
    ['>P'] = { '<Plug>(YankyPutIndentBeforeShiftRight)', 'Yanky PutIndent before shift right' },
    ['<P'] = { '<Plug>(YankyPutIndentBeforeShiftLeft)',  'Yanky PutIndent before shift left' },

    -- Special
    ['=p'] =  { '<Plug>(YankyPutAfterFilter)',   'Yanky Put After', mode = { 'n', 'x' } },
    ['=P'] =  { '<Plug>(YankyPutBeforeFilter)',  'Yanky Put After', mode = { 'n', 'x' } },
    ['=gp'] = { '<Plug>(YankyGPutAfterFilter)',  'Yanky Put After', mode = { 'n', 'x' } },
    ['=gP'] = { '<Plug>(YankyGPutBeforeFilter)', 'Yanky Put After', mode = { 'n', 'x' } },
  })

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
    event = 'BufReadPost',
    config = config,
  },
}
