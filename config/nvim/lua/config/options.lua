-- Neovim internal option configs
-- Try not to repeat many of neovim defaults `:help nvim-defaults`
local opt = vim.opt
local o   = vim.o
local g   = vim.g

-- Operations
opt.autochdir       = false
opt.autowriteall    = true
opt.backup          = true
opt.clipboard       = 'unnamed,unnamedplus' -- better safe than sorry
opt.cursorbind      = false -- Like scrollbind for cursor, let we edit same file in 2 split
opt.errorbells      = false
opt.ignorecase      = true
opt.inccommand      = 'split' -- cmdline search & replace open in split
opt.lazyredraw      = false -- better ui performance
opt.modelines       = 2
opt.mouse           = 'a'
opt.sessionoptions  = { 'buffers', 'curdir', 'folds', 'tabpages', 'winsize', 'winpos', 'terminal' }
-- use default shada value, better performance.
-- opt.shada           = { '!', '\'1000', '<50', 's10', 'h' }
opt.smartcase       = true
opt.swapfile        = false
opt.undofile        = true
opt.updatetime      = 2000
opt.visualbell      = false

-- Looks & feels
opt.conceallevel    = 2     -- Hide * markup for bold & italic
opt.cursorcolumn    = false
opt.cursorline      = false -- horizontal highlight line with cursor
opt.laststatus      = 3     -- global statusline, overrides by lualine *globalstatus*
opt.linebreak       = true  -- If we enable wrap at least wrap it at end of word
opt.number          = true
opt.previewheight   = 25    --height of preview window
opt.relativenumber  = true
opt.scrolloff       = 5     -- Show 5 line above & below cursor
opt.showcmd         = true  -- already in defaults
opt.showmode        = false -- we already have mode in statusline
opt.sidescrolloff   = 5     -- Show 5 columns left & right cursor
opt.signcolumn      = 'yes' -- AKA the gutter, smallest size = 'yes:1'
opt.splitbelow      = true
opt.splitright      = true
opt.termguicolors   = true  -- enable truecolor
opt.title           = true
opt.virtualedit     = 'all' -- move cursor anywhere
opt.wrap            = false

-- Default tab, spaces & indentation
local tabStop       = 2
opt.tabstop         = tabStop
opt.shiftwidth      = tabStop
opt.softtabstop     = tabStop
opt.autoindent      = true  -- already in defaults
opt.cindent         = true
opt.copyindent      = true
opt.expandtab       = true
opt.shiftround      = true
opt.smartindent     = true  -- already in defaults
opt.smarttab        = true  -- already in defaults

-- User
opt.spelllang = { 'en' }
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
o.formatoptions = "jcroqlnt" -- default=jcroql

-- Folding: managed by treesitter
opt.foldenable      = false
opt.foldlevel       = 20
opt.foldnestmax     = 5
opt.foldminlines    = 3

-- completion
opt.completeopt     = { 'menu', 'menuone', 'noselect' }
opt.wildignore      = {} -- add file type to ignore completions

-- Cool floating window popup menu for completion on command line
opt.pumblend        = 10
opt.wildmode        = 'longest:full,full'

-- Special characters for highlighting non-printing spaces/tabs/etc
-- Characters configs. Sample: eol:↓, eol:¬, eol:↲, eol:⏎, tab:␉·, trail:␠, nbsp:⎵
opt.list            = false -- show special characters
opt.listchars       = {
  eol='↲',
  tab='▸ ',
  trail='·',
  extends='»',
  precedes='«',
  nbsp='⎵',
  conceal='×',
}

-- Extend defaults, remove ugly vertical seperator & end of boundry char
opt.fillchars:append {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┨',
  vertright = '┣',
  verthoriz = '╋',
  -- vert = ' ',
  eob = ' ',
  -- fold = " ",
  foldopen = "",
  -- foldsep = " ",
  foldclose = "",
}
opt.diffopt:append   'vertical' -- Diff always open in vsplit
opt.shortmess:append 'c'        -- don't give |ins-completion-menu| messages.

-- Highlight VCS conflict markers
-- vim.cmd [[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]

-- disable some builtin plugins
g.loaded_2html_plugin   = 1
g.loaded_gzip           = 1
g.loaded_man            = 1
g.loaded_matchit        = 1
g.loaded_matchparen     = 1
g.loaded_netrwPlugin    = 1
g.loaded_remote_plugins = 1
g.loaded_shada_plugin   = 1
g.loaded_tar            = 1
g.loaded_tarPlugin      = 1
g.loaded_zip            = 1
g.loaded_zipPlugin      = 1

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.o.shortmess = "filnxtToOFWIcC" -- default: icxTFlotOnf. Rm `I` to have :intro
end

-- References: {
-- https://github.com/tarruda/dot-files
-- https://github.com/junegunn/dotfiles
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua
-- https://github.com/folke/dot/blob/master/config/nvim/lua/config/options.lua
-- }
