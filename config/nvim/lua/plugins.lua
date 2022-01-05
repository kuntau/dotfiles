-- Plugins with packer.nvim

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local packer_bookstrap

if fn.empty(fn.glob(install_path)) > 0 then
  local packer_repo = 'https://github.com/wbthomason/packer.nvim'
  packer_bookstrap = fn.system({'git', 'clone', '--depth', '1',packer_repo, install_path})
end

vim.cmd 'packadd packer.nvim'

local packer = require("packer")

return packer.startup({function(use)

  -- dev
  if fn.empty(fn.glob('~/coding/vim/unimpaired.nvim')) == 0 then
    use { '~/coding/vim/unimpaired.nvim', cond = false }
  end

  -- Essentials
  -- use { 'nvim-lua/plenary.nvim' }
  use { 'antoinemadec/FixCursorHold.nvim', config = 'vim.g.cursorhold_updatetime = 100' } -- Fix CursorHold,CursorHoldI bug
  use { 'kuntau/impatient.nvim', requires = { { 'tami5/sqlite.lua', commit = '5725b89e56dddf58b254570ce15a61a0efe5fab2' } } }
  use { 'kuntau/vim-osc52', keys = '<c-c>' } -- Copy & paste across tmux & screen over mosh
  use { 'wbthomason/packer.nvim', opt = true } -- Packer can manage itself
  use { 'kyazdani42/nvim-tree.lua', config = [[require('config.nvimtree')]], cmd = 'NvimTreeToggle' }
  use { 'mbbill/undotree', config = [[vim.g.undotree_SetFocusWhenToggle = 1]],  cmd = 'UndotreeToggle' }
  use { 'nvim-telescope/telescope.nvim', requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', config = [[require('telescope').load_extension('fzf')]], run = 'make', after = 'telescope.nvim', },
      { 'nvim-telescope/telescope-frecency.nvim', config = [[require('telescope').load_extension('frecency')]], requires = { { 'tami5/sqlite.lua', commit = '5725b89e56dddf58b254570ce15a61a0efe5fab2' } }, after = 'telescope.nvim' },
      { 'ahmedkhalf/project.nvim', after = 'telescope.nvim', config = function () require('project_nvim').setup() require('telescope').load_extension('projects') end, },
    },
    config = [[require('config._telescope')]],
    cmd = 'Telescope',
  }
  -- use { 'mhinz/vim-startify', config = [[require('config.startify')]] }

  -- Movements
  use { 'tpope/vim-unimpaired', keys = {'yo', '[', ']'} }
  use { 'tpope/vim-rsi', event = 'InsertEnter *' }
  use { 'ggandor/lightspeed.nvim', keys = { 's', 'S', 'f', 'F', 't', 'T' } }
  use { 'mg979/vim-visual-multi', keys = '<c-n>'  }

  -- Syntaxes and such
  use { 'nvim-treesitter/nvim-treesitter', requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor',    event = 'InsertEnter *' }, -- Refactor module for treesitter
      { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'InsertEnter *' }, -- text-objects module for treesitter
      { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'Comment.nvim' }, -- context-commentstring module for treesitter
      { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', ft = {'md','vue','html','jsx','tsx'} }, -- auto complete HTML tags
      { 'p00f/nvim-ts-rainbow', ft = {'fnl'} },
    },
    config = [[require('config.treesitter')]],
    run = ':TSUpdate' -- We recommend updating the parsers cmd update
  }
  use { 'tpope/vim-surround', keys = { {'v', 'S'}, 'y', 'c', 'd' } }
  use { 'tpope/vim-repeat', keys = '.' }
  use { 'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' } } -- gS for splitting & gJ for joining
  use { 'numToStr/Comment.nvim', config = [[require('Comment').setup()]], keys = { {'n','gc'}, {'v','gc'} } } -- Comment plugins with treesitter support
  use { 'windwp/nvim-autopairs', config = [[require('config.autopairs')]], event = 'InsertEnter *' } -- autopairs plugin
  use { 'andymass/vim-matchup', config = [[require('config.matchup')]], event = 'InsertEnter *' } -- Replace default `matchit` & `matchparen`

  -- LSP & diagnostics
  -- use { 'onsails/lspkind-nvim' } -- LSP completion menu icons
  -- use { 'folke/lsp-colors.nvim' }
  use { 'kevinhwang91/nvim-bqf', event = 'QuickFixCmdPre *' }
  use { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline' }
  use { 'neovim/nvim-lspconfig', config = [[require('config.lsp')]] }
  use { 'folke/trouble.nvim', config = [[require('config.trouble')]], cmd = 'Trouble' }

  -- Completions
  use { 'hrsh7th/nvim-cmp', requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
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
    after = 'nvim-treesitter',
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  -- VCS
  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]], event = 'InsertEnter *' }
  use { 'TimUntersberger/neogit', config = [[require('config.neogit')]], cmd = 'Neogit' }
  use { 'sindrets/diffview.nvim', config = [[require('config.diffview')]], cmd = 'DiffviewOpen' }

  -- Snippets
  use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' }
  use { 'rafamadriz/friendly-snippets' }

  -- Colorschemes
  use { 'kuntau/ayu-vim', branch = 'italic', opt = true }
  use { 'gruvbox-community/gruvbox', opt = true } -- Slowwww
  use { 'arcticicestudio/nord-vim', opt = true }
  use { 'NLKNguyen/papercolor-theme', opt = true }
  use { 'rakr/vim-one', opt = true }
  use { 'catppuccin/nvim', as = 'catppuccin', config = [[require('config.catppuccin')]], cond = false }
  use { 'EdenEast/nightfox.nvim', config = [[require('config.nightfox')]], cond = false }
  use { 'marko-cerovac/material.nvim', config = 'vim.g.material_style = "palenight"', cond = false }
  use { 'folke/tokyonight.nvim', cond = true }
  use { 'rebelot/kanagawa.nvim', cond = true } -- tokyonight + gruvbox

  -- Misc bundle
  use { 'junegunn/vim-easy-align', keys = {{'v','ga'}, 'ga'} }
  use { 'christoomey/vim-tmux-navigator', cmd = {'TmuxNavigateLeft','TmuxNavigateRight','TmuxNavigateUp','TmuxNavigateDown',} }
  use { 'dstein64/vim-startuptime', config = 'vim.g.startuptime_tries = 5', cmd = 'StartupTime' } -- startup time benachmarking

  -- UI & UX
  use { 'kyazdani42/nvim-web-devicons' } -- for file icons
  use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent')]], cmd = 'IndentBlanklineToggle' }
  use { 'norcalli/nvim-colorizer.lua', config = [[require('colorizer').setup()]], ft = {'html', 'vue', 'css', 'jsx', 'tsx', 'scss', 'js', 'ts', 'haml', 'md', 'styl'} }
  use { 'famiu/bufdelete.nvim', cmd = 'Bdelete' } -- improve :bdelete experience

  -- StatusLine, bufferline & tabline
  use { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' } -- Tmux statusline
  use { 'nvim-lualine/lualine.nvim', config = [[require('config.statusline')]] } -- statusline

  -- Language specifics
  use { 'SidOfc/mkdx', ft = 'markdown', config = [[require('config.markdown')]] }

  -- automatically setup configurations after cloning packer
  if packer_bookstrap then
    packer.sync()
  end
end,
  config = {
    display = { open_fn = require("packer.util").float },
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
