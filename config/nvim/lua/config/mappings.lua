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
map('<D-s>',   '<cmd>up!<cr>', 'Save')
map('<M-C-S>', '<cmd>up!<cr>', 'Save') -- hyper_key
imap('<D-v>',  '<c-r>+', 'Paste')
nmap('R',      ':help <c-r><c-w><cr>', 'Open help for word under cursor')
nmap('<F5>',   function() require("specs").show_specs() end, 'Show cursor location')
nmap('<Leader>rm',     function() vim.cmd('up') require("utils").reload_module() end, 'Save & reload module')
nmap('<Leader>ro',     '<cmd>up<cr><cmd>luafile %<cr>', 'Save & re-source current file')
nmap('<Leader><Tab>',  '<C-^>', 'Toggle alternate file')
nmap('<LocalLeader>w', '<cmd>up!<cr>', 'Save')

-- Terminal movements
local ts = [[<C-\><C-n>]] -- terminal map shortcut
nmap('<Leader>oC', '<cmd>'..(orien() == 'vertical' and 's' or 'vs')..'plit term://nu<cr>')
nmap('<Leader>oc', '<cmd>term<cr>')
tmap('<LocalLeader><Esc>', ts, 'Escape terminal')
tmap('<M-`>', function() require('FTerm').toggle() end, 'Toggle FTerm')
map('<M-`>',  function() require('FTerm').toggle() end, 'Toggle FTerm')

-- Better arrow key
nmap('<right>', '<cmd>bnext<cr>', 'Next buffer')
nmap('<left>',  '<cmd>bprevious<cr>', 'Prev buffer')

-- Moving block of codes
nmap('<m-j>', ':m .+1<CR>==', 'Move current line down')
nmap('<m-k>', ':m .-2<CR>==', 'Move current line up')
vmap('J', ":m '>+1<CR>gv=gv", 'Move selected line down')
vmap('K', ":m '<-2<CR>gv=gv", 'Move selected line up')
imap('<m-j>', '<Esc>:m .+1<CR>==gi', 'Move current line down')
imap('<m-k>', '<Esc>:m .-2<CR>==gi', 'Move current line up')

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>noh<Bar>diffupdate<cr><c-l>', 'Clear search highlight')

-- buffer management
nmap('<M-Tab>',        '<C-^>', 'Toggle alternate file')
nmap('<LocalLeader>W','<cmd>xall<cr>', 'Save & Quit all')
nmap('<LocalLeader>Q', '<cmd>qa!<cr>', 'Quit all')
nmap('<LocalLeader>q', '<cmd>q!<cr>', 'Quit window')
nmap('<LocalLeader>x', '<cmd>BDelete! this<cr>', 'Delete this buffer')
nmap('<LocalLeader>X', '<cmd>BDelete! other<cr>', 'Delete other buffer')
nmap('<LocalLeader>c', '<cmd>close!<cr>', 'Close window')
nmap('<LocalLeader><Tab>', '<cmd>Telescope buffers<cr>', 'Select open buffers')
nmap('g0', function () vim.cmd('edit '..vim.fn.fnameescape(vim.v.oldfiles[1])) end, {desc="Open last edited"})

-- windows movements
for i=9,0,-1 do
  nmap('<M-'..i..'>', function()
    if i == 0 then i = 100 end -- HACK: so we can do Alt-0 to go to last window
    local code = vim.api.nvim_replace_termcodes('<c-w>', true, true, true)
    local cmd = string.format('normal! %s%s%s', i, code, code)
    vim.api.nvim_command(cmd) -- nvim_exec also work
  end, {desc='Go to windows '..i})
end

-- Plugins
nmap('<F1>', '<cmd>Startify<cr>', 'Open Startify')
nmap('<F3>', '<cmd>NvimTreeToggle<cr>', 'Toggle file explorer')

-- Register which-key
wk.register({
  -- Improve defaults
  gh = { '^', 'Goto first non-blank char' },
  gl = { '$', 'Goto last non-blank char' },

  -- Telescope bindings
  ['<c-p>'] = { '<cmd>Telescope fd<cr>', 'Find files fd' },
  ['<Leader>f'] = {
    name = 'Telescope',
    A = { function() require('telescope').extensions.aerial.aerial() end, 'Aerial' },
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
  },

  ['gt'] = {
    name = 'Tabs',
    t = { '<cmd>tabnext<cr>',     'Switch to next tab' },
    T = { '<cmd>tabprevious<cr>', 'Switch to previous tab' },
    c = { '<cmd>tabclose<cr>',    'Close current tab' },
    n = { '<cmd>tabnew<cr>',      'Open new tab' },
  },

  ['go'] = {
    name = 'Plugins',
    g = { function() require('neogit').open({ kind = (orien() == 'vertical' and 'split' or 'vsplit') }) end, 'Open neogit in split' },
    G = { function() require('neogit').open({ kind = 'replace' }) end, 'Open neogit in current window' },
    c = { function() vim.cmd((orien() == 'vertical' and 's' or 'vs') .. 'plit') vim.cmd('term') end, 'Open terminal in split' },
    C = { function() vim.cmd('term') end, 'Open terminal in current window' },
    e = { function() require('nvim-tree.api').tree.toggle() end, 'Toggle FileTree' },
    E = { function() require('nvim-tree').open_replacing_current_buffer() end, 'Open Tree in current window' },
    r = { function() require('hlargs').toggle() end, 'Toggle hlargs' },
    a = { '<cmd>AerialToggle!<cr>', 'Toggle Aerial' },
    h = { '<cmd>Startify<cr>', 'Open Startify' },
    l = { '<cmd>Lazy<cr>', 'Open Lazy' },
    i = { '<cmd>IndentBlanklineToggle<cr>', 'Toggle IndentBlankline' },
    t = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle Trouble document diagnostics' },
    d = { '<cmd>DiffviewOpen<cr>', 'Open Diffview' },
    u = { '<cmd>UndotreeToggle<CR>', 'Toggle Undotree' },
  },

  -- Register empty desc
  ['g'] = { name = 'Go' },
  [']'] = 'Unimpaired',
  ['['] = 'Unimpaired',
})

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
