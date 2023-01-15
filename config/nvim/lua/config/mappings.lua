-- mappings.lua: My custom keyboard mappings
-- NOTES: Use <cmd> only when have <cr>

local map  = require('utils').map
local nmap = require('utils').nmap
local imap = require('utils').imap
local vmap = require('utils').vmap
local tmap = require('utils').tmap
local orien = require('utils').get_win_orientation
local wk = require("which-key")

-- Basic
map('<D-s>',          '<cmd>up!<cr>')
map('<M-C-S>',        '<cmd>up!<cr>') -- hyper_key
imap('<D-v>',         '<c-r>+')
nmap('R',             ':help <c-r><c-w><cr>')
nmap('<Leader><Tab>', '<C-^>')
nmap('<Leader>ro',    '<cmd>up<cr><cmd>luafile %<cr>')
nmap('<Leader>rm',    '<cmd>up<cr><cmd>lua require("utils").reload_module()<cr>')
nmap('<LocalLeader>w','<cmd>up!<cr>')
nmap('<F5>','<cmd>lua require("specs").show_specs()<cr>')

-- Terminal movements
local ts = [[<C-\><C-n>]] -- terminal map shortcut
nmap('<Leader>oC', '<cmd>'..(orien() == 'vertical' and 's' or 'vs')..'plit term://nu<cr>')
nmap('<Leader>oc', '<cmd>term<cr>')
tmap('<LocalLeader><Esc>', ts)
tmap('<M-`>', [[<cmd>lua require('FTerm').toggle()<CR>]])
map('<M-`>', [[<cmd>lua require('FTerm').toggle()<CR>]])

-- Better arrow key
nmap('<right>', '<cmd>bnext<cr>')
nmap('<left>',  '<cmd>bprevious<cr>')

-- Moving block of codes
nmap('<m-j>', ':m .+1<CR>==')
nmap('<m-k>', ':m .-2<CR>==')
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")
imap('<m-j>', '<Esc>:m .+1<CR>==gi')
imap('<m-k>', '<Esc>:m .-2<CR>==gi')

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>nohlsearch<Bar>diffupdate<cr><c-l>')

-- buffer management
nmap('<M-Tab>',        '<C-^>')
nmap('<LocalLeader>W','<cmd>xall<cr>')
nmap('<LocalLeader>Q', '<cmd>qa!<cr>')
nmap('<LocalLeader>q', '<cmd>q!<cr>')
nmap('<LocalLeader>x', '<cmd>BDelete! this<cr>')
nmap('<LocalLeader>X', '<cmd>BDelete! other<cr>')
nmap('<LocalLeader>c', '<cmd>close!<cr>')
nmap('<LocalLeader><Tab>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', 'g0', function () vim.cmd('edit '..vim.fn.fnameescape(vim.v.oldfiles[1])) end, {desc="Open latest file in v:oldfiles"})

-- tab management
nmap('gtt', '<cmd>tabnext<cr>',     {desc='Switch to next tab'})
nmap('gtT', '<cmd>tabprevious<cr>', {desc='Switch to previous tab'})
nmap('gtc', '<cmd>tabclose<cr>',    {desc='Close current tab'})
nmap('gtn', '<cmd>tabnew<cr>',      {desc='Open new tab'})

-- Plugins
vmap('<c-c>',      '<Plug>(YankOSC52)', { noremap = false })
nmap('<Leader>ee', '<cmd>NvimTreeToggle<cr>')
nmap('<F3>',       '<cmd>NvimTreeToggle<cr>')
nmap('<Leader>ei', '<cmd>IndentBlanklineToggle<cr>')
nmap('gos',        '<cmd>Startify<cr>')
nmap('<F1>',       '<cmd>Startify<cr>')
nmap('<Leader>oT', '<cmd>TroubleToggle document_diagnostics<cr>')
nmap('<Leader>oD', '<cmd>DiffviewOpen<cr>')
nmap('U',          '<cmd>UndotreeToggle<CR>')
nmap('goh',        '<cmd>Scratch<CR>')

-- windows movements
for i=9,0,-1 do
  vim.keymap.set('n', '<M-'..i..'>', function()
    if i == 0 then i = 100 end -- HACK: so we can do Alt-0 to go to last window
    local code = vim.api.nvim_replace_termcodes('<c-w>', true, true, true)
    local cmd = string.format('normal! %s%s%s', i, code, code)
    vim.api.nvim_command(cmd) -- nvim_exec also work
  end, {desc='Go to windows '..i})
end

-- Telescope bindings
wk.register({
  ['<c-p>'] = { '<cmd>Telescope fd<cr>', 'Find files fd' },
  ['<Leader>f'] = {
    name = 'Telescope',
    f = { function() require('telescope').extensions.frecency.frecency({ workspace='CWD' }) end, 'Frecency in CWD' },
    F = { function() require('telescope').extensions.frecency.frecency() end, 'Frecency' },
    p = { function() require('telescope').extensions.project.project({ display_type='full' }) end, 'Project' },
    P = { function() require('telescope').extensions.projects.projects() end, 'Project' },
    o = { '<cmd>Telescope oldfiles<cr>', 'Recent files in CWD' },
    O = { '<cmd>Telescope oldfiles only_cwd=false<cr>', 'Recent files' },
    a = { '<cmd>Telescope builtin<cr>', 'Show builtin modules' },
    i = { '<cmd>Telescope git_files<cr>', 'Git files' },
    t = { '<cmd>Telescope filetypes<cr>', 'Filetypes' },
    g = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
    l = { '<cmd>Telescope buffers<cr>', 'List open buffers' },
    h = { '<cmd>Telescope help_tags<cr>', 'Help tags' },
    c = { '<cmd>Telescope commands<cr>', 'Commands' },
    r = { '<cmd>Telescope resume<cr>', 'Resume last action' },
    [';'] = { '<cmd>Telescope command_history<cr>', 'Command history' },
    ['/'] = { '<cmd>Telescope search_history<cr>', 'Search history' },
  }
})

vim.keymap.set('n', 'gog', function () require('neogit').open({kind=(orien() == 'vertical' and 'split' or 'vsplit')}) end, {desc="Open neogit in split"})
vim.keymap.set('n', 'goG', function () require('neogit').open({kind='replace'}) end, {desc="Open neogit in current window"})
vim.keymap.set('n', 'goc', function () vim.cmd((orien() == 'vertical' and 's' or 'vs')..'plit') vim.cmd 'term' end, {desc="Open terminal in split"})

-- junegunn easy-align
-- vmap('ga', '<Plug>(EasyAlign)', { noremap = false })
-- nmap('ga', '<Plug>(EasyAlign)', { noremap = false })

---@abbreviations
vim.cmd.ia [[<expr> ddate strftime('%d/%m/%Y')]]

-- NEXT: Experimental
-- nmap('<F23>', '<cmd>split<cr>')  -- S-F11
-- nmap('<F35>', '<cmd>vsplit<cr>') -- C-F11
-- nmap('<M-S-F11>', '<cmd>vsplit<cr>') -- M-S-F11
-- nmap('<F24>', '<cmd>split<cr>')  -- S-F12
-- nmap('<F36>', '<cmd>vsplit<cr>') -- C-F12
-- nmap('<M-S-F12>', '<cmd>vsplit<cr>') -- M-S-F12
-- nmap('<S-F11>', '<cmd>split<cr>')
-- nmap('<C-F11>', '<cmd>split<cr>')
-- nmap('<C-S-F11>', '<cmd>vsplit<cr>')
-- nmap('<S-F12>', '<cmd>split<cr>')
-- nmap('<C-F12>', '<cmd>split<cr>')
-- nmap('<C-S-F12>', '<cmd>vsplit<cr>')
-- nmap('<M-@>', '<cmd>split<cr>')
-- nmap('<S-M-@>', '<cmd>split<cr>')
-- <F23><F22><F21><F20><F19><F35><F23><F34><S-F11><C-S-F11><S-F9>
-- nmap('<S-CR>', '<cmd>vsplit<cr>')
-- nmap('<C-CR>', '<cmd>vsplit<cr>')
-- imap('<S-CR>', '<cmd>vsplit<cr>')
-- imap('<C-CR>', '<cmd>vsplit<cr>')
