-- nvim-cmp

local cmp = require('cmp')
local luasnip = require('luasnip')
local source_mapping = {
  fuzzy_buffer    = "｢FB｣",
  nvim_lsp        = "｢LSP｣",
  nvim_lua        = "｢API｣",
  cmp_tabnine     = "｢T9｣",
  copilot         = "｢CO｣",
  path            = "｢P｣",
  tmux            = "｢TX｣",
  luasnip         = "｢S｣",
  cmdline         = "｢:｣",
  cmdline_history = "｢:/｣",
  nvim_lsp_signature_help = '｢SIG｣'
}
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    -- ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-f>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<S-CR>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    -- ['<Tab>'] = cmp.config.disable,
    -- ['<S-Tab>'] = cmp.config.disable,
    -- start luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.confirm({ select = true})
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- end luasnip

  },
  sources = cmp.config.sources({
    -- this order = priority
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp', max_item_count = 50 },
    { name = 'nvim_lua', max_item_count = 50 },
    { name = 'copilot' }, -- github copitlot
    { name = 'cmp_tabnine' }, -- tabnine
    { name = 'path' }, -- path completion
    { name = 'tmux', keyword_length = 5, max_item_count = 5 }, -- tmux
    { name = 'fuzzy_buffer', keyword_length = 5, max_item_count = 10 }, -- buffer
  }),
  sorting = {
      priority_weight = 2,
      comparators = {
        require('cmp_fuzzy_buffer.compare'),
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      }
    },
  formatting = {
    format = require('lsp.kind').cmp_format({
      icon = true,
      text = true,
      menu = source_mapping,
    }),
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'fuzzy_buffer', --[[ keyword_length = 3 ]] },
    { name = 'nvim_lsp_document_symbol' },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', keyword_length=2, max_item_count=50 },
    { name = 'cmdline_history', max_item_count=5 },
  })
})

-- Setting up cmp sources by FileType
-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
