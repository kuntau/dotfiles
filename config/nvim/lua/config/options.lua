-- Neovim internal option configs
-- Try not to repeat many of neovim defaults `:help nvim-defaults`

-- Operations
vim.o.autochdir       = false
vim.o.autowriteall    = true
vim.o.backup          = true
vim.o.clipboard       = 'unnamed,unnamedplus' -- better safe than sorry
vim.o.cursorbind      = false -- Like scrollbind for cursor, let we edit same file in 2 split
vim.o.errorbells      = false
vim.o.ignorecase      = true
vim.o.inccommand      = 'split' -- cmdline search & replace open in split
vim.o.lazyredraw      = false -- better ui performance
vim.o.modelines       = 2
vim.o.mouse           = 'a'
vim.o.smartcase       = true
vim.o.swapfile        = false
vim.o.undofile        = true
vim.o.updatetime      = 2000
vim.o.visualbell      = false
vim.opt.sessionoptions  = { 'buffers', 'curdir', 'folds', 'tabpages', 'winsize', 'winpos', 'terminal' }

-- Looks & feels
vim.o.conceallevel    = 2     -- Hide * markup for bold & italic
vim.o.cursorcolumn    = false
vim.o.cursorline      = false -- horizontal highlight line with cursor
vim.o.laststatus      = 3     -- global statusline, overrides by lualine *globalstatus*
vim.o.linebreak       = true  -- If we enable wrap at least wrap it at end of word
vim.o.number          = true
vim.o.previewheight   = 25    -- height of preview window
vim.o.relativenumber  = true
vim.o.scrolloff       = 5     -- Show 5 line above & below cursor
vim.o.showcmd         = true  -- already in defaults
vim.o.showmode        = false -- we already have mode in statusline
vim.o.sidescrolloff   = 5     -- Show 5 columns left & right cursor
vim.o.signcolumn      = 'yes' -- AKA the gutter, smallest size = 'yes:1'
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.o.termguicolors   = true  -- enable truecolor
vim.o.title           = true
vim.o.virtualedit     = 'all' -- move cursor anywhere
vim.o.wrap            = false

-- Default tab, spaces & indentation
local tabStop       = 2
vim.o.tabstop         = tabStop
vim.o.shiftwidth      = tabStop
vim.o.softtabstop     = tabStop
vim.o.autoindent      = true  -- already in defaults
vim.o.cindent         = true
vim.o.copyindent      = true
vim.o.expandtab       = true
vim.o.shiftround      = true
vim.o.smartindent     = true  -- already in defaults
vim.o.smarttab        = true  -- already in defaults

-- User
vim.o.formatoptions = "jcroqlnt/" -- default=jcroql
vim.opt.spelllang = { 'en', 'ms' }
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Folding: managed by treesitter
vim.o.foldenable      = false
vim.o.foldlevel       = 20
vim.o.foldnestmax     = 5
vim.o.foldminlines    = 3

-- completion
vim.opt.completeopt     = { 'menu', 'menuone', 'noselect' }
vim.opt.wildignore      = {} -- add file type to ignore completions

-- Cool floating window popup menu for completion on command line
vim.opt.pumblend        = 10
vim.opt.wildmode        = 'longest:full,full'

-- Special characters for highlighting non-printing spaces/tabs/etc
-- Characters configs. Sample: eol:↓, eol:¬, eol:↲, eol:⏎, tab:␉·, trail:␠, nbsp:⎵
vim.opt.list            = false -- show special characters
vim.opt.listchars       = {
  eol='↲',
  tab='▸ ',
  trail='·',
  extends='»',
  precedes='«',
  nbsp='⎵',
  conceal='×',
}

-- Extend defaults, remove ugly vertical seperator & end of boundry char
vim.opt.fillchars:append {
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
vim.opt.diffopt:append   'vertical' -- Diff always open in vsplit
vim.opt.shortmess:append 'c'        -- don't give |ins-completion-menu| messages.

-- Highlight VCS conflict markers
-- vim.cmd [[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']]

-- disable some builtin plugins
vim.g.loaded_2html_plugin   = 1
vim.g.loaded_gzip           = 1
vim.g.loaded_man            = 1
vim.g.loaded_matchit        = 1
vim.g.loaded_matchparen     = 1
vim.g.loaded_netrwPlugin    = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin   = 1
vim.g.loaded_tar            = 1
vim.g.loaded_tarPlugin      = 1
vim.g.loaded_zip            = 1
vim.g.loaded_zipPlugin      = 1

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
