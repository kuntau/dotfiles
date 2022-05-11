-- configs for Comment.nvim

 require('Comment').setup({
  pre_hook = function(ctx)
    local commnet_utils = require('Comment.utils')

    local location = nil
    if ctx.ctype == commnet_utils.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == commnet_utils.cmotion.v or ctx.cmotion == commnet_utils.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == commnet_utils.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
 })
