-- options.lua

if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end
vim.opt.autochdir = false
vim.opt.autowriteall = true
vim.opt.clipboard = 'unnamed'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.undofile = true
vim.opt.visualbell = false
vim.opt.wrap = false

-- Default tab & spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true

-- Folding options
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 5

-- completion menu ignore
vim.opt.wildignore = {}

vim.opt.list = true -- show special characters
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'} -- Special characters for highlighting non-printing spaces/tabs/etc
vim.opt.fillchars:append({ vert = ' ', eob = ' '}) -- remove ugly vertical seperator & end of boundry char

vim.cmd 'au FocusLost * silent! noautocmd up'
vim.cmd 'au FocusGained * silent! noautocmd checktime'
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}'
