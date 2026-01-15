-- blink.cmp

---@module 'blink.cmp'
---@type blink.cmp.Config
local blink_opts = {
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono' -- mono, normal
  },

  keymap = { preset = 'super-tab' }, -- default, enter, super-tab
  completion = {
    accept = { auto_brackets = { enabled = true }, },
    menu = {
      auto_show = true,
      border = 'rounded',
      draw = {
        padding = { 1, 1 }, -- padding only on right side
        columns = {
          { 'kind_icon', gap = 1 },
          { 'label', --[[ 'label_description', ]] gap = 1 },
          -- { 'kind' },
          { 'source_name' }, -- This adds the [LSP] or [Path] tag on the far right
        },
        components = {
          kind_icon = {
            text = function(ctx)
              --   local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              local kind_icon = require('lsp.kind').get(ctx.kind)
              return kind_icon .. ctx.icon_gap .. ' '
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          source_name = {
            text = function(ctx)
              return '〈' .. ctx.source_name .. '〉'
            end
          },
        },
      },
    },
    list = {
      selection = {
        -- preselect = function(ctx)
        --   return ctx.mode == "cmdline" and "auto_insert" or "preselect"
        -- end,
        preselect = function(ctx)
          return not require('blink.cmp').snippet_active({ direction = 1 })
        end,
        auto_insert = function(ctx) return vim.bo.filetype ~= 'markdown' end,
      },
    },
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = { border = 'rounded' }
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'omni', 'lazydev', 'yank' },
    per_filetype = {
      lua = { inherit_defaults = true, 'lazydev' }
    },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
      yank = {
        name = 'Yanky',
        module = 'blink-yanky',
        opts = {
          minLength = 5,
          onlyCurrentFiletype = true,
          trigger_characters = { '"' },
          kind_icon = '󰅍',
        },
      },
    }
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
  snippets = { preset = 'luasnip' },

  cmdline = {
    enabled = true,
    keymap = { preset = 'default' }, -- none, default, inherit
    completion = {
      list = { selection = { preselect = false } },
      menu = {
        -- auto_show = function(ctx)
        --   return vim.fn.getcmdtype() == ":"
        -- end,
        auto_show = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" then
            return { "cmdline" }
          end
          return {}
        end,

      },
      ghost_text = { enabled = true },
    },
  },
}

local blink_extend = { 'sources.default' }

return {
  {
    'saghen/blink.cmp',
    version = '*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = blink_opts,
    opts_extend = blink_extend,
    dependencies = {
      { 'marcoSven/blink-cmp-yanky', },
    },
  }
}

--[[

local config_cmp = function()
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
  }
  require('luasnip.loaders.from_vscode').lazy_load()

  cmp.setup({
    experimental = {
      -- ghost_text = { hl_group = "CmpGhostText" },
      ghost_text = false,
    },
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
      -- { name = 'nvim_lua', max_item_count = 50 },
      -- { name = 'cmp_tabnine' }, -- tabnine
      { name = 'path' }, -- path completion
      { name = 'tmux', keyword_length = 5, max_item_count = 5 }, -- tmux
      { name = 'fuzzy_buffer',
        keyword_length = 5,
        max_item_count = 10,
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
              if buftype ~= 'nofile' and buftype ~= 'prompt' then
                bufs[#bufs + 1] = buf
              end
            end
            return bufs
          end
        }
      }, -- buffer
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
    window = {
      completion = {
        -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -5,
        side_padding = 0,
      },
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
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
      { name = 'fuzzy_buffer', keyword_length = 3 },
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

  -- If you want insert `(` after select function or method item
  -- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
  )

  -- Setting up cmp sources by FileType
  -- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]-]
  end

return {
  -- Completions
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      -- 'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'andersevenrud/cmp-tmux',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      { 'hrsh7th/cmp-nvim-lsp', event = 'BufReadPost' },
      -- { 'tzachar/cmp-tabnine', build = './install.sh', config = config_tabnine }
    },
    config = config_cmp,
    event = 'InsertEnter',
  },
  { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
  { 'dmitmel/cmp-cmdline-history', event = 'CmdlineEnter' },
  {
    'tzachar/cmp-fuzzy-buffer',
    event = 'CmdlineEnter',
    dependencies = {
      {
        'tzachar/fuzzy.nvim',
        dependencies = 'nvim-telescope/telescope-fzf-native.nvim'
      }
    },
  },
}

]]
