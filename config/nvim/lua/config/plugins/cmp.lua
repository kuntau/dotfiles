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
