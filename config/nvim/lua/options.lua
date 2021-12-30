-- Neovim internal option configs
-- Try not to repeat many of neovim defaults `:help nvim-defaults`

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
vim.opt.linebreak       = true   -- If we enable wrap at least wrap it at end of word
vim.opt.previewheight   = 25 --height of preview window

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
vim.opt.pumblend        = 10
vim.opt.wildmode        = "longest:full"

-- Characters configs. Sample: eol:↓, eol:¬, eol:↲, eol:⏎, tab:␉·, trail:␠, nbsp:⎵
vim.opt.list            = false -- show special characters
vim.opt.listchars       = {eol='↲', tab='▸ ', trail='·', extends='»', precedes='«', nbsp='⎵', conceal='×'} -- Special characters for highlighting non-printing spaces/tabs/etc
vim.opt.fillchars       = { vert = ' ', eob = ' '} -- remove ugly vertical seperator & end of boundry char

-- Extend defaults
vim.opt.diffopt:append 'vertical' -- Diff always open in vsplit
vim.opt.shortmess:append 'c' -- Diff always open in vsplit

-- Highlight VCS conflict markers
-- vim.cmd [[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]

-- disable some builtin plugins
vim.g.loaded_matchparen     = 1
vim.g.loaded_matchit        = 1
vim.g.loaded_gzip           = 1
vim.g.loaded_man            = 1
vim.g.loaded_shada_plugin   = 1
vim.g.loaded_tarPlugin      = 1
vim.g.loaded_tar            = 1
vim.g.loaded_zipPlugin      = 1
vim.g.loaded_zip            = 1
vim.g.loaded_netrwPlugin    = 1
vim.g.loaded_2html_plugin   = 1
vim.g.loaded_remote_plugins = 1

-- References: {
-- https://github.com/tarruda/dot-files
-- https://github.com/junegunn/dotfiles
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua
-- }
