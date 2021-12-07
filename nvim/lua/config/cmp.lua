-- nvim-cmp

local cmp = require('cmp')
local lspkind = require('lspkind')
-- local types = require('cmp.types')

local feedkey = require("utils").feedkey
local source_mapping = {
  buffer = "[Buf]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[api]",
  cmp_tabnine = "[TN]",
  copilot = "[CO]",
  path = "[path]",
  tmux = "[TX]",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- start vim-vsnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end vim-vsnip

  },

  sources = cmp.config.sources({
    -- this order = priority
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'copilot' }, -- github copitlot
    { name = 'cmp_tabnine' }, -- tabnine
    { name = 'buffer', keyword_length = 5 }, -- buffer
    { name = 'path' }, -- path completion
    { name = 'tmux', keyword_length = 5, max_item_count = 5 }, -- tmux
  }),

  formatting = {
    format = lspkind.cmp_format({
      with_text = false, -- do not show text alongside icons
      menu = source_mapping,
      -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

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
  -- completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
  -- documentation = {
  --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --   scrollbar = "║",
  -- },
  experimental = {
    native_menu = false,
    ghost_text = false,
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 3 },
    -- { name = 'nvim_lsp_document_symbol', keyword_length = 3 },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', max_item_count = 20, keyword_length = 3 }
  })
})

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
