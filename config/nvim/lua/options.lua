-- Neovim internal option configs
-- Try not to repeat many of neovim defaults `:help nvim-defaults`

vim.cmd [[
  augroup init_lua
    autocmd!
  augroup END
]]

-- Operations
vim.opt.autochdir       = false
vim.opt.autowriteall    = true
vim.opt.backup          = false
vim.opt.clipboard       = 'unnamed,unnamedplus' -- better safe than sorry
vim.opt.cursorbind      = false -- Like scrollbind for cursor, let we edit same file in 2 split
vim.opt.errorbells      = false
vim.opt.ignorecase      = true
vim.opt.inccommand      = 'split' -- cmdline search & replace open in split
vim.opt.lazyredraw      = false -- better ui performance
vim.opt.mouse           = 'a'
vim.opt.shada           = { "!", "'1000", "<50", "s10", "h" }
vim.opt.smartcase       = true
vim.opt.swapfile        = false
vim.opt.undofile        = true
vim.opt.updatetime      = 1000
vim.opt.visualbell      = false

-- Looks & feels
vim.opt.cursorcolumn    = false
vim.opt.cursorline      = true -- horizontal highlight line with cursor
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.scrolloff       = 5 -- Show 5 line above & below cursor
vim.opt.showcmd         = true  -- already in defaults
vim.opt.showmode        = false -- we already have mode in statusline
vim.opt.signcolumn      = 'yes:1' -- AKA the gutter, smallest size
vim.opt.splitbelow      = true
vim.opt.splitright      = true
vim.opt.termguicolors   = true -- enable truecolor
vim.opt.title           = true
vim.opt.wrap            = false

-- Default tab, spaces & indentation
local tabStop           = 2
vim.opt.tabstop         = tabStop
vim.opt.shiftwidth      = tabStop
vim.opt.softtabstop     = tabStop
vim.opt.autoindent      = true  -- already in defaults
vim.opt.cindent         = true
vim.opt.copyindent      = true
vim.opt.expandtab       = true
vim.opt.shiftround      = true
vim.opt.smartindent     = true  -- already in defaults
vim.opt.smarttab        = true  -- already in defaults

-- Folding: managed by treesitter
vim.opt.foldenable      = false
vim.opt.foldlevel       = 20
vim.opt.foldnestmax     = 5
vim.opt.foldminlines    = 3

-- completion
vim.opt.completeopt     = { 'menu', 'menuone', 'noselect' }
vim.opt.wildignore      = {} -- add file type to ignore completions

-- Cool floating window popup menu for completion on command line
vim.opt.pumblend        = 17
vim.opt.wildmode        = "longest:full"

-- Characters configs
vim.opt.list            = false -- show special characters
vim.opt.listchars       = {eol = '↲', tab = '▸ ', trail = '·'} -- Special characters for highlighting non-printing spaces/tabs/etc
vim.opt.fillchars       = { vert = ' ', eob = ' '} -- remove ugly vertical seperator & end of boundry char

-- Extend defaults
vim.opt.diffopt:append 'vertical' -- Diff always open in vsplit
vim.opt.shortmess:append 'c' -- Diff always open in vsplit

-- Highlight VCS conflict markers
vim.cmd [[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]

-- disable some builtin plugins
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit    = 1
vim.g.gzip              = 1
vim.g.man               = 1
vim.g.matchit           = 1
vim.g.matchparen        = 1
vim.g.shada_plugin      = 1
vim.g.tarPlugin         = 1
vim.g.tar               = 1
vim.g.zipPlugin         = 1
vim.g.zip               = 1
vim.g.netrwPlugin       = 1

vim.cmd 'au FocusLost * silent! noautocmd up'
vim.cmd 'au FocusGained * silent! noautocmd checktime'
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}'

-- References: {
-- https://github.com/tarruda/dot-files
-- https://github.com/junegunn/dotfiles
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua
-- }
