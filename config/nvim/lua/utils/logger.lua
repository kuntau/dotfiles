-- Logger.lua
-- Ripped from https://github.com/b0o/mapx.nvim/blob/a95e22ac1e17da5f216c84c7578f769165ea2fc1/lua/mapx/log.lua

local debug = true
local api = vim.api

local warn = function(...)
  api.nvim_echo({ { table.concat({ 'Warning:', ... }, ' '), 'WarningMsg' } }, true, {})
end

local getpwin = function ()
  for _, w in ipairs(api.nvim_tabpage_list_wins(0)) do
    if vim.fn.win_gettype(w) == 'preview' then
      return w
    end
  end
end

local previewAppend = function(lines)
  local pwin = getpwin()
  if pwin == nil then
    vim.cmd(string.format(
      'pedit +%s LOGGER',
      table.concat({ 'setlocal', 'nomodifiable', 'buftype=nofile', 'bufhidden=hide', 'nobuflisted',
        'noswapfile', 'nonumber', 'norelativenumber', 'nomodeline', 'nolist', 'scrolloff=0', 'ft=lprolog' }, '\\ ')
    ))
    pwin = getpwin()
  end
  if pwin == nil then
    return false
  end
  local pbuf = api.nvim_win_get_buf(pwin)
  api.nvim_buf_set_option(pbuf, 'modifiable', true)
  api.nvim_buf_set_lines(pbuf, -1, -1, false, lines)
  api.nvim_buf_set_option(pbuf, 'modifiable', false)
  api.nvim_win_set_cursor(pwin, { api.nvim_buf_line_count(pbuf), 0 })
  return true
end

-- debug writes debug messages to the preview window
local dbg = function(...)
  if not debug then
    return
  end
  local msg = string.format('[%s] %s\n', os.date '%H:%M:%S', table.concat({ ... }, ' '))
  if not previewAppend(vim.split(msg, '\n', true)) then
    print(...)
    return
  end
end

-- dbg + inspect
local dbgi = function(...)
  if not debug then
    return
  end
  local msg = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    if type(v) == 'table' or
       type(v) == 'function' or
       type(v) == 'thread' or
       type(v) == 'userdata' then
      table.insert(msg, vim.inspect(v))
    else
      table.insert(msg, v)
    end
  end
  dbg(table.concat(msg, ' '))
end

return {
  debug = debug,
  warn = warn,
  dbgi = dbgi,
}
