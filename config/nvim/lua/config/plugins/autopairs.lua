-- autopairs configs, powered by treesitter

local config = function()

  local apair   = require('nvim-autopairs')
  local rule    = require('nvim-autopairs.rule')
  local cond    = require('nvim-autopairs.conds')
  local end_lua = require('nvim-autopairs.rules.endwise-lua')

  apair.setup({
    check_ts = true,
    fastwrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = 0, -- Offset from pattern match
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
    ts_config = {
      -- lua = {'string'},
      javascript = {'template_string'},
    },
    disable_filetype = {
      'TelescopePrompt',
      'vim'
    }
  })

  -- add spaces between parentheses.
  local add_space_paren = {
    rule(' ', ' ')
      :with_pair(function (opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
      end),
    rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
    rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
    rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
  }

  -- add space around =
  local add_space_equal = {
    rule('=', '', { 'typescript', 'typescriptreact', 'javascript' })
      :with_pair(cond.not_inside_quote())
      :with_pair(function(opts)
        local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
        if last_char:match('[%w%=%s]') then
          return true
        end
        return false
      end)
      :replace_endpair(function(opts)
        local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
        local next_char = opts.line:sub(opts.col, opts.col)
        next_char = next_char == ' ' and '' or ' '
        if prev_2char:match('%w$') then
          return '<bs> =' .. next_char
        end
        if prev_2char:match('%=$') then
          return next_char
        end
        if prev_2char:match('=') then
          return '<bs><bs>=' .. next_char
        end
        return ''
      end)
      :set_end_pair_length(0)
      :with_move(cond.none())
      :with_del(cond.none())
  }

  -- add arrow key in javascript
  local add_arrow_js = {
    rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
      :use_regex(true)
      :set_end_pair_length(2),
  }

  apair.add_rules(end_lua)
  apair.add_rules(add_space_paren)
  apair.add_rules(add_space_equal)
  apair.add_rules(add_arrow_js)

end

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter *.*',
  config = config,
}
