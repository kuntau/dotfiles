-- Plugins with packer.nvim

local fn = vim.fn
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local packer_bookstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bookstrap = fn.system({'git', 'clone', '--depth', '1',packer_repo, install_path})
  -- print('BOOTSTRAP clone: '..packer_bootstrap)
end

vim.cmd 'packadd packer.nvim'

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  print('Something wrong while requiring packer')
  return
end

return packer.startup({function(use)

  -- dev
  if fn.empty(fn.glob('~/coding/vim/unimpaired.nvim')) == 0 then
    use '~/coding/vim/unimpaired.nvim'
  end

  -- Essentials
  use 'nvim-lua/plenary.nvim'
  -- use {'mhinz/vim-startify', config = [[require('config.startify')]]}
  use {'kuntau/vim-osc52', keys = '<c-c>'} -- Copy & paste across tmux & screen over mosh
  use {'wbthomason/packer.nvim', opt = true} -- Packer can manage itself
  use {'kyazdani42/nvim-tree.lua', config = [[require('config.nvimtree')]], cmd = 'NvimTreeToggle'}
  use {'mbbill/undotree', config = [[vim.g.undotree_SetFocusWhenToggle = 1]],  cmd = 'UndotreeToggle'}
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('config.telescope')]],
    cmd = 'Telescope',
    module = 'telescope',
    requires = {
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim'},
    }
  }

  -- Movements
  use {'tpope/vim-unimpaired', keys = {'yoc', 'yob', '[', ']'}}
  use {'tpope/vim-rsi', event = 'InsertEnter *'}
  use {'ggandor/lightspeed.nvim', keys = { 's', 'S', 'f', 'F', 't', 'T' }}
  use {'mg979/vim-visual-multi', keys = '<c-n>' }

  -- Syntaxes and such
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'nvim-treesitter/nvim-treesitter-refactor',    after = 'nvim-treesitter'}, -- Refactor module for treesitter
      {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}, -- text-objects module for treesitter
      {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}, -- context-commentstring module for treesitter
      {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}, -- auto complete HTML tags
      {'ahmedkhalf/project.nvim', config = [[require('project_nvim').setup()]], after = 'nvim-treesitter'}
    },
    config = [[require('config.treesitter')]],
    run = ':TSUpdate',
  }  -- We recommend updating the parsers cmd update
  use {'tpope/vim-surround', keys = { {'v', 'S'}, 'y', 'c', 'd' }}
  use {'tpope/vim-repeat', keys = '.'}
  use {'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' }} -- gS for splitting & gJ for joining
  use {'numToStr/Comment.nvim', config = [[require('Comment').setup()]], keys = { {'n','gc'}, {'v','gc'} }} -- Comment plugins with treesitter support
  use {'windwp/nvim-autopairs', config = [[require('config.autopairs')]]} -- autopairs plugin
  use {'andymass/vim-matchup', config = 'vim.g.matchup_matchparen_deferred = 1', event = 'InsertEnter *'} -- Replace default `matchit` & `matchparen`

  -- LSP & diagnostics
  use 'kevinhwang91/nvim-bqf'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim' -- LSP completion menu icons
  use 'folke/lsp-colors.nvim'
  use {'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline'}
  use {'neovim/nvim-lspconfig', config = [[require('config.lsp')]]}
  use {'folke/trouble.nvim', config = [[require('config.trouble')]], cmd = 'TroubleToggle'}

  -- Completions
  use {
    'hrsh7th/nvim-cmp',
    after = 'nvim-treesitter',
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      { 'github/copilot.vim',       after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua',     after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer',       after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path',         after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline',      after = 'nvim-cmp' },
      { 'hrsh7th/cmp-copilot',      after = 'nvim-cmp' },
      { 'andersevenrud/cmp-tmux',   after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      { 'tzachar/cmp-tabnine', run = './install.sh', config = [[require('config.tabnine')]], after = 'nvim-cmp' }
    },
  }

  -- VCS
  use {'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]]}
  use {'TimUntersberger/neogit', config = [[require('config.neogit')]], cmd = 'Neogit'}
  use {'sindrets/diffview.nvim', config = [[require('config.diffview')]], cmd = 'DiffviewOpen'}

  -- Snippets
  use {'L3MON4D3/LuaSnip', after = 'nvim-cmp'}
  use 'rafamadriz/friendly-snippets'

  -- Colorschemes
  use {'kuntau/ayu-vim', branch = 'italic', opt = true}
  use {'gruvbox-community/gruvbox', opt = true} -- Slowwww
  use {'arcticicestudio/nord-vim', opt = true}
  use {'rakr/vim-one', opt = true}
  use {'NLKNguyen/papercolor-theme', opt = true}
  use {'catppuccin/nvim', as = 'catppuccin', config = [[require('config.catppuccin')]]}
  use {'EdenEast/nightfox.nvim'}
  use {'folke/tokyonight.nvim'}
  use {'rebelot/kanagawa.nvim'} -- tokyonight + gruvbox

  -- Misc bundle
  use 'christoomey/vim-tmux-navigator'
  use {'junegunn/vim-easy-align'}
  use {'dstein64/vim-startuptime', config = 'vim.g.startuptime_tries = 5', cmd = 'StartupTime'} -- startup time benachmarking

  -- UI & UX
  use 'p00f/nvim-ts-rainbow'
  use 'kyazdani42/nvim-web-devicons' -- for file icons
  use {'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent')]]}
  use {'norcalli/nvim-colorizer.lua', config = [[require('colorizer').setup()]], ft = {'html', 'vue', 'css', 'jsx', 'tsx', 'scss', 'js', 'ts', 'haml', 'md', 'styl'}}
  use {'famiu/bufdelete.nvim', cmd = 'Bdelete'} -- improve :bdelete experience
  -- use { "tversteeg/registers.nvim", keys = { {'n','"', 'i','<c-r>'}} } -- Like `vim-peekaboo`

  -- StatusLine, bufferline & tabline
  use {'edkolev/tmuxline.vim', cmd = 'Tmuxline'} -- Tmux statusline
  use {'kdheepak/tabline.nvim', config = [[require('config.tabline')]]}
  use {'nvim-lualine/lualine.nvim', config = [[require('config.statusline')]]} -- statusline
  -- use('famiu/feline.nvim') -- statusline
  -- use('windwp/windline.nvim') -- statusline

  -- automatically setup configurations after cloning packer
  if packer_bookstrap then
    packer.sync()
  end
end,
  config = {
    -- display = { open_fn = require("packer.util").float},
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
