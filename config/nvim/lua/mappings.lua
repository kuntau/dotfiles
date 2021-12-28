-- mappings.lua: My custom keyboard mappings
-- NOTES: Use <cmd> only when have <cr>

local nmap = require('utils').nmap
local imap = require('utils').imap
local vmap = require('utils').vmap
local tmap = require('utils').tmap
local dbgi  = require('utils.logger').dbgi
local warn  = require('utils.logger').warn
local orientation = require('utils').getWinOrientation

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Basic
nmap('<D-s>',      '<cmd>up!<cr>')
imap('<D-s>',      '<cmd>up!<cr>')
imap('<D-v>',      '<c-r>+')
nmap('R',          ':help <c-r><c-w><cr>')
nmap('<Leader>so', '<cmd>up<cr><cmd>luafile %<cr>')
nmap('<Leader>rm', '<cmd>up<cr><cmd>lua require("utils").reloadModule()<cr>')

-- LocalLeader mappings
nmap('<LocalLeader>q', '<cmd>only<cr><cmd>q!<cr>')
nmap('<LocalLeader>x', '<cmd>Bdelete!<cr>')
nmap('<LocalLeader>c', '<cmd>close!<cr>')

-- Terminal movements
local ts = [[<C-\><C-n>]] -- terminal map shortcut
nmap('<Leader>oC', '<cmd>'..(orientation() == 'vertical' and 's' or 'vs')..'plit term://zsh<cr>')
nmap('<Leader>oc', '<cmd>term<cr>')
tmap('<Esc>', ts)

-- Better arrow key
nmap('<right>',   '<cmd>bnext<cr>')
nmap('<left>',    '<cmd>bprevious<cr>')
nmap('<M-right>', '<cmd>tabnext<cr>')
nmap('<M-left>',  '<cmd>tabprevious<cr>')

-- Moving block of codes
nmap('<m-j>', ':m .+1<CR>==')
nmap('<m-k>', ':m .-2<CR>==')
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")
imap('<m-j>', '<Esc>:m .+1<CR>==gi')
imap('<m-k>', '<Esc>:m .-2<CR>==gi')

if vim.fn.has('nvim-0.7') ~= 1 then
  nmap('Q', '@q')
end

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>nohlsearch<Bar>diffupdate<cr><c-l>')

-- buffer management
nmap('<leader>bd', '<cmd>Bdelete!<cr>')

-- Plugins
vmap('<c-c>',      '<Plug>(YankOSC52)')
nmap('<Leader>ee', '<cmd>NvimTreeToggle<cr>')
nmap('<F3>',       '<cmd>NvimTreeToggle<cr>')
nmap('<Leader>ei', '<cmd>IndentBlanklineToggle<cr>')
nmap('<Leader>fz', '<cmd>FZF<cr>')
nmap('<Leader>S',  '<cmd>Startify<cr>')
nmap('<Leader>G',  '<cmd>Neogit kind='..(orientation() == 'horizontal' and 'vsplit' or 'split')..'<cr>')
nmap('<Leader>oT', '<cmd>TroubleToggle document_diagnostics<cr>')
nmap('<Leader>oD', '<cmd>DiffviewOpen<cr>')
nmap('U',          '<cmd>UndotreeToggle<CR>')

-- Splitjoin
nmap('gJ', '<cmd>SplitjoinJoin<cr>')
nmap('gS', '<cmd>SplitjoinSplit<cr>')

-- Telescope bindings
nmap('<c-p>',      '<cmd>Telescope find_files<cr>')
nmap('<leader>tp', '<cmd>Telescope projects<cr>')
nmap('<leader>to', '<cmd>Telescope oldfiles<cr>')
nmap('<leader>tO', '<cmd>Telescope oldfiles only_cwd=false<cr>')
nmap('<leader>t:', '<cmd>Telescope command_history<cr>')
nmap('<leader>t/', '<cmd>Telescope search_history<cr>')
nmap('<Leader>fa', '<cmd>Telescope builtin<cr>')
nmap('<Leader>fi', '<cmd>Telescope git_files<cr>')
nmap('<Leader>ft', '<cmd>Telescope file_browser<cr>')
nmap('<Leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<Leader>ff', '<cmd>Telescope buffers<cr>')
nmap('<Leader>fh', '<cmd>Telescope help_tags<cr>')
nmap('<Leader>fz', '<cmd>Telescope help_tags<cr>')
nmap('<Leader>fr', '<cmd>Telescope resume<cr>')

-- junegunn easy-align
vmap('ga', '<Plug>(EasyAlign)', { noremap = false })
nmap('ga', '<Plug>(EasyAlign)', { noremap = false })
