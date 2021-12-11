-- mappings.lua: My custom keyboard mappings

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local nmap = require('utils').nmap
local imap = require('utils').imap
local vmap = require('utils').vmap

nmap('<LocalLeader>q', ':q<cr>')
nmap('<F4>', ':up!<cr>')
imap('<F4>', '<c-o>:up!<cr>')
nmap('<Leader>so', ':up<cr>:luafile %<cr>')
nmap('<Leader><Leader>', ':')
nmap('<Leader>rm', '<cmd>up<cr><cmd>lua require("utils").reloadModule()<cr>')

-- better arrow key
nmap('<right>', ':bn<cr>')
nmap('<left>',  ':bp<cr>')

-- Alternate version which don't use bookmark
nmap('<m-j>', ':m .+1<CR>==')
nmap('<m-k>', ':m .-2<CR>==')
vmap('<m-j>', ":m '>+1<CR>gv=gv")
vmap('<m-k>', ":m '<-2<CR>gv=gv")
-- inoremap <m-j> <Esc>:m .+1<CR>==gi
-- inoremap <m-k> <Esc>:m .-2<CR>==gi

-- clear search highlight
nmap('<Leader><c-l>', '<cmd>nohlsearch<Bar>diffupdate<cr><c-l>')

-- qq to record, Q to replay
nmap('Q', '@q')

-- buffer management
nmap('<leader>bd', ':bdelete<cr>')

-- Plugins
vmap('<c-c>','<Plug>(YankOSC52)', { noremap = true })
nmap('<Leader>ee', ':NvimTreeToggle<cr>')
nmap('<Leader>fz', ':FZF<cr>')
nmap('<Leader>S', ':Startify<cr>')
nmap('<Leader>G', ':Neogit kind=split_above<cr>')
nmap('<Leader>oT', ':Trouble document_diagnostics<cr>')
nmap('<Leader>oD', ':DiffviewOpen<cr>')
nmap('<Leader>oS', ':lua require("spectre").open()<cr>')

-- Telescope bindings
nmap('<c-p>', ':Telescope find_files<cr>')
nmap('<Leader>fa', ':Telescope builtin<cr>')
nmap('<Leader>ff', ':Telescope git_files<cr>')
nmap('<Leader>ft', ':Telescope find_browser<cr>')
nmap('<Leader>fg', ':Telescope live_grep<cr>')
nmap('<Leader>fb', ':Telescope buffers sort_lastused=true<cr>')
nmap('<Leader>fh', ':Telescope help_tags<cr>')

-- junegunn easy-align
vmap('ga', '<Plug>(EasyAlign)', { noremap = false })
nmap('ga', '<Plug>(EasyAlign)', { noremap = false })
