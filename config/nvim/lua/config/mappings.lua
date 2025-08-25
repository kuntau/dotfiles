-- mappings.lua: My custom keyboard mappings
-- NOTES: Use <cmd> only when have <cr>

local Utils = require('utils')
local Mapper = Utils.mapper
local map, cmap, nmap, imap, vmap, tmap = Utils.map, Utils.cmap, Utils.nmap, Utils.imap, Utils.vmap, Utils.tmap
local open_url = Utils.open_url
local rtc = Mapper.replace_termcodes
local orien = Utils.get_win_orientation

-- Basic
nmap('<cr>',   ':', { silent = false, desc = 'Enter command line' })
map('<M-C-S>', '<cmd>up!<cr>', 'Save') -- hyper_key
nmap('gK',     ':help <c-r><c-w><cr>', 'Open help for word under cursor')
nmap('<Leader>rm',     function() vim.cmd('up') require("utils").reload_module() end, 'Save & reload module')
nmap('<Leader>ro',     '<cmd>up<cr><cmd>luafile %<cr>', 'Save & re-source current file')
nmap('<Leader><Tab>',  '<C-^>', 'Toggle alternate file')
nmap('<LocalLeader>w', '<cmd>up!<cr>', 'Save')

-- Terminal movements
local ts = [[<C-\><C-n>]] -- terminal map shortcut
tmap('<LocalLeader><Esc>', ts, 'Escape terminal')
tmap('<M-`>', function() require('FTerm').toggle() end, 'Toggle FTerm')
map('<M-`>',  function() require('FTerm').toggle() end, 'Toggle FTerm')

-- Better arrow key
nmap('<right>', '<cmd>bnext<cr>', 'Next buffer')
nmap('<left>',  '<cmd>bprevious<cr>', 'Prev buffer')

-- Moving block of codes
nmap('<M-j>', ':m .+1<CR>==', 'Move current line down')
nmap('<M-k>', ':m .-2<CR>==', 'Move current line up')
vmap('J',     ":m '>+1<CR>gv=gv", 'Move selected line down')
vmap('K',     ":m '<-2<CR>gv=gv", 'Move selected line up')
imap('<M-j>', '<Esc>:m .+1<CR>==gi', 'Move current line down')
imap('<M-k>', '<Esc>:m .-2<CR>==gi', 'Move current line up')

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>noh<Bar>diffupdate<cr><c-l>', 'Clear search highlight')

-- buffer management
nmap('<M-Tab>',        '<C-^>', 'Toggle alternate file')
nmap('<LocalLeader>W', '<cmd>xall<cr>', 'Save & Quit all')
nmap('<LocalLeader>Q', '<cmd>qa!<cr>', 'Quit all')
nmap('<LocalLeader>q', '<cmd>q!<cr>', 'Quit window')
nmap('<LocalLeader>x', '<cmd>BDelete! this<cr>', 'Delete this buffer')
nmap('<LocalLeader>X', '<cmd>BDelete! other<cr>', 'Delete other buffer')
nmap('<LocalLeader>c', '<cmd>close!<cr>', 'Close window')
-- nmap('<LocalLeader><Tab>', '<cmd>Telescope buffers<cr>', 'Select open buffers')
-- nmap('g0', function () vim.cmd('edit '..vim.fn.fnameescape(vim.v.oldfiles[1])) end, "Open last edited")

-- windows switcher. CTRL-0..CTRL-9
for i = 9, 0, -1 do
  nmap('<C-' .. i .. '>', function()
    if i == 0 then i = 100 end -- HACK: so we can do CTRL-0 to go to last window
    local code = rtc('<c-w>')
    vim.cmd(string.format('normal! %s%s%s', i, code, code))
  end, 'Go to windows ' .. i)
end

-- Plugins
nmap('<F1>', '<cmd>Startify<cr>', 'Open Startify')
nmap('<F3>', '<cmd>NvimTreeToggle<cr>', 'Toggle file explorer')

-- Folds & UFO
nmap('zR', function() require('ufo').openAllFolds() end)
nmap('zM', function() require('ufo').closeAllFolds() end)
nmap('zr', function() require('ufo').openFoldsExceptKinds() end)
nmap('zm', function() require('ufo').closeFoldsWith() end)
nmap('K', function() if not require('ufo').peekFoldedLinesUnderCursor() then vim.cmd('normal! K') end end)
vmap('<Leader>za', '<Esc>`<kzfgg`>jzfG`<', 'Fold above & below')
nmap('<Leader>za', '<Esc>zRzz', 'Unfold above & below')

-- improve defaults
map('gh', '_', 'Goto first non-blank char')
map('gl', 'g_', 'Goto last non-blank char')

-- Smart URL opener
nmap('gx', function ()
  require("various-textobjs").url() -- select URL
  local foundURL = vim.fn.mode():find("v") -- only switches to visual mode if found
  local url
  if foundURL then
    vim.cmd.normal { '"zy', bang = true } -- retrieve URL with "z as intermediary
    url = vim.fn.getreg("z")
    open_url(url)
  else
    -- if not found in proximity, search whole buffer via urlview.nvim instead
    vim.cmd.UrlView("buffer")
  end
end, {desc = "Smart URL Opener"})

-- Plugins bindings. TODO: Move this to their own plugin spec
nmap('gog', function() require('neogit').open({ kind = (orien() == 'vertical' and 'split' or 'vsplit') }) end, 'Open neogit in split')
nmap('goG', function() require('neogit').open({ kind = 'replace' }) end, 'Open neogit in current window')
nmap('goc', function() vim.cmd((orien() == 'vertical' and 's' or 'vs') .. 'plit') vim.cmd('term') end, 'Open terminal in split')
nmap('goC', function() vim.cmd('term') end, 'Open terminal in current window')
nmap('goe', function() require('oil').open() end, 'Open Oil in current buffer')
nmap('goE', function() require('oil').toggle_float() end, 'Toggle Oil in float')
nmap('gor', function() require('hlargs').toggle() end, 'Toggle hlargs')
nmap('goa', '<cmd>AerialToggle!<cr>', 'Toggle Aerial')
nmap('goy', '<cmd>SymbolsOutline<cr>', 'Toggle Symbols Outline')
nmap('goh', '<cmd>Dashboard<cr>', 'Open Dashboard')
nmap('gol', '<cmd>Lazy<cr>', 'Open Lazy')
nmap('got', '<cmd>Trouble diagnostics toggle<cr>', 'Toggle Trouble diagnostics')
nmap('god', '<cmd>DiffviewOpen<cr>', 'Open Diffview')
nmap('gou', '<cmd>UndotreeToggle<CR>', 'Toggle Undotree')

-- GUI mappings, with CMD key
map('<D-s>',   '<cmd>up!<cr>', 'Save')
imap('<D-s>',   '<c-o><cmd>up!<cr>', 'Save')
vmap('<D-c>',  '"+y', 'Paste')
imap('<D-v>',  '<c-r>+', 'Paste')
tmap('<D-v>',  '<c-r>+', 'Paste')
cmap('<D-v>',  '<c-r>"', 'Paste')
map('<D-f>', function()
  if vim.g.neovide == true then
    vim.cmd(":let g:neovide_fullscreen = !g:neovide_fullscreen")
  end
end, 'Toogle fullscreen') -- Toggle neovide fullscreen

---@abbreviations
vim.cmd.ia [[<expr> ddate strftime('%d/%m/%Y')]]
