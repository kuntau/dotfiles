-- options.lua

vim.cmd [[
  augroup init_lua
    autocmd!
  augroup END
]]

vim.opt.autochdir = false
vim.opt.autowriteall = true
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.visualbell = false
vim.opt.wrap = false

-- Default tab & spaces
local tabStop = 2
vim.opt.tabstop = tabStop
vim.opt.shiftwidth = tabStop
vim.opt.softtabstop = tabStop
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true

-- Folding: managed by treesitter
vim.opt.foldenable = false
vim.opt.foldlevel = 20
vim.opt.foldnestmax = 5
vim.opt.foldminlines = 3

-- completion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.wildignore = {} -- add file type to ignore completions

vim.opt.list = false -- show special characters
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'} -- Special characters for highlighting non-printing spaces/tabs/etc
vim.opt.fillchars = { vert = ' ', eob = ' '} -- remove ugly vertical seperator & end of boundry char

-- disable matchparen
vim.g.loaded_matchparen = 0

vim.cmd 'au FocusLost * silent! noautocmd up'
vim.cmd 'au FocusGained * silent! noautocmd checktime'
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}'
