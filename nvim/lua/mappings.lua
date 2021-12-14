-- mappings.lua: My custom keyboard mappings

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local nmap = require('utils').nmap
local imap = require('utils').imap
local vmap = require('utils').vmap

nmap('<LocalLeader>q',   '<cmd>q<cr>')
nmap('<F4>',             '<cmd>up!<cr>')
imap('<F4>',             '<c-o><cmd>up!<cr>')
nmap('<Leader>so',       '<cmd>up<cr><cmd>luafile %<cr>')
nmap('<Leader><Leader>', ':')
nmap('<Leader>rm',       '<cmd>up<cr><cmd>lua require("utils").reloadModule()<cr>')

-- better arrow key
nmap('<right>', '<cmd>bn<cr>')
nmap('<left>',  '<cmd>bp<cr>')

-- Alternate version which don't use bookmark
nmap('<m-j>', '<cmd>m .+1<CR>==')
nmap('<m-k>', '<cmd>m .-2<CR>==')
vmap('J', "<cmd>m '>+1<CR>gv=gv")
vmap('K', "<cmd>m '<-2<CR>gv=gv")
imap('<m-j>', '<Esc><cmd>m .+1<CR>==gi')
imap('<m-k>', '<Esc><cmd>m .-2<CR>==gi')

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>nohlsearch<Bar>diffupdate<cr><c-l>')

-- qq to record, Q to replay
nmap('Q', '@q')

-- buffer management
nmap('<leader>bd', '<cmd>Bdelete<cr>')

-- Plugins
vmap('<c-c>',      '<Plug>(YankOSC52)', { noremap = true })
nmap('<Leader>ee', '<cmd>NvimTreeToggle<cr>')
nmap('<Leader>fz', '<cmd>FZF<cr>')
nmap('<Leader>S',  '<cmd>Startify<cr>')
nmap('<Leader>G',  '<cmd>Neogit kind=split_above<cr>')
nmap('<Leader>oT', '<cmd>Trouble document_diagnostics<cr>')
nmap('<Leader>oD', '<cmd>DiffviewOpen<cr>')
nmap('U',          '<cmd>UndotreeToggle<CR>')
-- nmap('<Leader>oS', '<cmd>lua require("spectre").open()<cr>')

-- Telescope bindings
nmap('<c-p>',      '<cmd>Telescope find_files<cr>')
nmap('<Leader>fa', '<cmd>Telescope builtin<cr>')
nmap('<Leader>ff', '<cmd>Telescope git_files<cr>')
nmap('<Leader>ft', '<cmd>Telescope find_browser<cr>')
nmap('<Leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<Leader>fb', '<cmd>Telescope buffers sort_lastused=true<cr>')
nmap('<Leader>fh', '<cmd>Telescope help_tags<cr>')

-- junegunn easy-align
vmap('ga', '<Plug>(EasyAlign)', { noremap = false })
nmap('ga', '<Plug>(EasyAlign)', { noremap = false })
