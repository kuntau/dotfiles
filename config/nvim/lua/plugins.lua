-- Plugins with packer.nvim

local fn = vim.fn
local packer_path = '/site/pack/packer/start/packer.nvim'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_path = fn.stdpath('data') .. packer_path
local packer_bookstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bookstrap = fn.system({'git', 'clone', '--depth', '1',packer_repo, install_path})
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  error 'Something wrong while requiring packer'
  return
end

return packer.startup({function(use)

  -- dev
  if fn.empty(fn.glob('~/coding/vim/unimpaired.nvim')) == 0 then
    use '~/coding/vim/unimpaired.nvim'
  end

  -- Essentials
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'nvim-lua/plenary.nvim'
  use 'kuntau/vim-osc52' -- Copy & paste across tmux & screen over mosh
  use{'mhinz/vim-startify', config = function () require('config.startify') end}
  use{'nvim-telescope/telescope.nvim', config = function () require('config.telescope') end}
  use{'kyazdani42/nvim-tree.lua', config = function () require('config.nvimtree') end}
  use{'mbbill/undotree', config = function() vim.g.undotree_WindowsLayout = 2 end,  cmd = 'UndotreeToggle'}

  -- Movements
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-rsi'
  use 'ggandor/lightspeed.nvim'
  use 'mg979/vim-visual-multi'

  -- Syntaxes and such
  use{'nvim-treesitter/nvim-treesitter',
    config = function () require('config.treesitter') end,
    run = ':TSUpdate'
  }  -- We recommend updating the parsers cmd update
  use 'nvim-treesitter/nvim-treesitter-refactor'  -- Refactor module for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- text-objects module for treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- context-commentstring module for treesitter
  use 'windwp/nvim-ts-autotag' -- auto complete HTML tags
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'AndrewRadev/splitjoin.vim' -- gS for splitting & gJ for joining
  use{'numToStr/Comment.nvim', config = function () require('Comment').setup() end} -- Comment plugins with treesitter support
  use{'windwp/nvim-autopairs', config = function () require('config.autopairs') end} -- autopairs plugin
  use{'andymass/vim-matchup', config = function () vim.g.matchup_matchparen_deferred = 1 end} -- Replace default `matchit` & `matchparen`

  -- LSP & diagnostics
  use 'kevinhwang91/nvim-bqf'
  use{'neovim/nvim-lspconfig', config = function () require('config.lsp') end}
  use{'folke/trouble.nvim', config = function () require('config.trouble') end}

  -- Completions
  use 'github/copilot.vim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-copilot'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'andersevenrud/cmp-tmux'
  use{'tzachar/cmp-tabnine', run = './install.sh', config = function () require('config.tabnine') end}
  use{'hrsh7th/nvim-cmp', config = function () require('config.cmp') end}

  -- VCS
  use{'lewis6991/gitsigns.nvim', config = function () require('config.gitsigns') end}
  use{'TimUntersberger/neogit', config = function () require('config.neogit') end}
  use{'sindrets/diffview.nvim', config = function () require('config.diffview') end}

  -- Snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Colorschemes
  use 'folke/lsp-colors.nvim'
  use 'gruvbox-community/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'rakr/vim-one'
  use 'EdenEast/nightfox.nvim'
  use 'NLKNguyen/papercolor-theme'
  -- use{'catppuccin/nvim', config = function () require('config.catppuccin') end}
  use{'kuntau/ayu-vim', branch = 'italic'}

  -- Misc bundle
  use 'christoomey/vim-tmux-navigator'
  use 'junegunn/vim-easy-align'
  use{'dstein64/vim-startuptime', cmd = 'StartupTime'} -- startup time benachmarking
  use{'ahmedkhalf/project.nvim', config = function () require('project_nvim').setup() end}

  -- UI & UX
  use 'p00f/nvim-ts-rainbow'
  use 'kyazdani42/nvim-web-devicons' -- for file icons
  use 'onsails/lspkind-nvim' -- LSP completion menu icons
  use{'lukas-reineke/indent-blankline.nvim', config = function () require('config.indent') end}
  use{'norcalli/nvim-colorizer.lua', config = function () require('colorizer').setup() end}
  use{'famiu/bufdelete.nvim', cmd = 'Bdelete'} -- improve :bdelete experience
  use{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- StatusLine, bufferline & tabline
  use 'edkolev/tmuxline.vim' -- Tmux statusline
  use{'kdheepak/tabline.nvim', config = function () require('config.tabline') end}
  use{'nvim-lualine/lualine.nvim', config = function() require('config.statusline') end} -- statusline
  -- use('famiu/feline.nvim') -- statusline
  -- use('windwp/windline.nvim') -- statusline

  -- automatically setup configurations after cloning packer
  if packer_bookstrap then
    packer.sync()
  end
end,
  config = {
    display = { open_fn = require("packer.util").float},
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
