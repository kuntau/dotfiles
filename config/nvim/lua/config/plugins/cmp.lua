-- nvim-cmp

-- tabnine configs
local config_tabnine = function()
  local tabnine = require('cmp_tabnine.config')

  tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = {
      -- lua = true
    };
  })
end

local config = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local source_mapping = {
    fuzzy_buffer    = "〈FB〉",
    nvim_lsp        = "〈LSP〉",
    nvim_lua        = "〈API〉",
    cmp_tabnine     = "〈T9〉",
    copilot         = "〈CO〉",
    path            = "〈P〉",
    tmux            = "〈TX〉",
    luasnip         = "〈S〉",
    cmdline         = "〈:〉",
    cmdline_history = "〈:/〉",
    nvim_lsp_signature_help = '〈SIG〉'
  }
  require('luasnip.loaders.from_vscode').lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete({}),
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping.abort(),
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

    }),
    sources = cmp.config.sources({
      -- this order = priority
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim_lsp', max_item_count = 50 },
      { name = 'nvim_lua', max_item_count = 50 },
      { name = 'nvim_lsp_signature_help' },
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
        text = false,
        menu = source_mapping,
      }),
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'fuzzy_buffer', --[[ keyword_length = 3 ]] },
      { name = 'nvim_lsp_document_symbol' },
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline', keyword_length=2, max_item_count=50 },
      { name = 'cmdline_history', max_item_count=5 },
    })
  })

  -- Setting up cmp sources by FileType
  -- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
end

return {
  -- Completions
  { 'hrsh7th/nvim-cmp', dependencies = {
    { 'hrsh7th/cmp-nvim-lsp', event = 'BufReadPost' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'andersevenrud/cmp-tmux' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'tzachar/cmp-tabnine', build = './install.sh', config = config_tabnine }
  },
    config = config,
    event = 'InsertEnter *.*',
  },
  { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
  { 'dmitmel/cmp-cmdline-history', event = 'CmdlineEnter' },
  { 'tzachar/cmp-fuzzy-buffer', event = 'CmdlineEnter', dependencies = 'tzachar/fuzzy.nvim' },
}
