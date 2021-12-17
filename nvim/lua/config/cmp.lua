-- nvim-cmp

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()
local source_mapping = {
  buffer = "[Buf]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[API]",
  cmp_tabnine = "[T9]",
  copilot = "[CO]",
  path = "[Path]",
  tmux = "[TX]",
  vsnip = "[VSNiP]",
  luasnip = "[LSNiP]",
}

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

    -- start luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
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
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'nvim_lua', max_item_count = 20 },
    { name = 'copilot' }, -- github copitlot
    { name = 'cmp_tabnine' }, -- tabnine
    { name = 'path' }, -- path completion
    { name = 'buffer', keyword_length = 5, max_item_count = 10 }, -- buffer
    { name = 'tmux', keyword_length = 5, max_item_count = 5 }, -- tmux
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = false, -- do not show text alongside icons
      menu = source_mapping,
      maxwidth = 60, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function (entry, vim_item)
      -- local word = entry:get_insert_text()
      -- if entry.completion_item.insertTextFormat == types.lsp.insertTextFormat.Snippet then
      --   word = vim.lsp.util.parse_snippet(word)
      -- end
      -- word = str.oneline()
      -- if entry.completion_item.insertTextFormat == types.lsp.insertTextFormat.Snippet then
      --   word = word .. '~'
      -- end
      -- return vim_item
      -- end
    })
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 3 },
    { name = 'nvim_lsp_document_symbol' },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', max_item_count = 20, keyword_length = 2 }
  })
})

-- Setting up cmp sources by FileType
-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
