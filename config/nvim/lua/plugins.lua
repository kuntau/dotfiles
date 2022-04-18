-- Plugins with packer.nvim

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local disable_cmds = true

if fn.empty(fn.glob(install_path)) > 0 then
  local packer_repo = 'https://github.com/wbthomason/packer.nvim.git'
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path})
end

if fn.has('nvim-0.7') ~= 1 or PACKER_BOOTSTRAP then
  vim.cmd 'packadd packer.nvim'
  disable_cmds = false
end

local packer = require('packer')

packer.init {
  disable_commands = disable_cmds,
  display = { open_fn = function ()
    return require('packer.util').float({ style = 'minimal', border = 'rounded'})
  end },
  compile_path = fn.stdpath('config')..'/lua/packer_compiled.lua', -- Move to lua dir so impatient.nvim can cache it
  max_jobs = 12,
  git = {
    cmd = 'git',
    subcommands = {
      update = 'pull --ff --progress --rebase=true',
    }
  }
}

return packer.startup(function(use)

  -- dev
  if fn.isdirectory(fn.glob('~/coding/vim/unimpaired.nvim')) == 1 then
    use { '~/coding/vim/unimpaired.nvim', disable = true }
  end

  -- Essentials
  use { 'lewis6991/impatient.nvim' }
  use { 'kuntau/vim-osc52', keys = '<c-c>' } -- Copy & paste across tmux & screen over mosh
  use { 'wbthomason/packer.nvim', opt = true } -- Packer can manage itself
  use { 'kyazdani42/nvim-tree.lua', config = [[require('config.nvimtree')]], cmd = 'NvimTreeToggle' }
  use { 'mbbill/undotree', config = [[
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_HelpLine = 0
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_TreeNodeShape = '⧂'
    vim.g.undotree_TreeVertShape = '│'
    vim.g.undotree_TreeSplitShape = '╱'
    vim.g.undotree_TreeReturnShape = '╲'
    vim.g.undotree_SetFocusWhenToggle = 1
  ]],  cmd = 'UndotreeToggle' }
    -- vim.g.undotree_TreeNodeShape = '●'
  -- use { 'nvim-telescope/telescope.nvim', requires = {
  use { '~/coding/forks/telescope.nvim', requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', config = [[require('telescope').load_extension('fzf')]], run = 'make', after = 'telescope.nvim', },
      { 'nvim-telescope/telescope-frecency.nvim', config = [[require('telescope').load_extension('frecency')]], requires = { 'tami5/sqlite.lua', event = 'BufReadPre' }, after = 'telescope.nvim' },
      { 'ahmedkhalf/project.nvim', after = 'telescope.nvim', config = function () require('project_nvim').setup() require('telescope').load_extension('projects') end, },
    },
    config = [[require('config._telescope')]],
    cmd = 'Telescope',
  }
  use { 'mhinz/vim-startify', config = [[require('config.homepage').startify()]] }

  -- Movements
  use { 'tpope/vim-unimpaired', event = 'BufReadPost' }
  use { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }
  use { 'ggandor/lightspeed.nvim', config = 'vunmap S', keys = { 's', 'S', 'f', 'F', 't', 'T' } }
  use { 'mg979/vim-visual-multi', keys = '<c-n>'  }

  -- Syntaxes and such
  use { 'nvim-treesitter/nvim-treesitter', requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor',    after = 'nvim-treesitter' }, -- Refactor module for treesitter
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }, -- text-objects module for treesitter
      { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' }, -- Location and syntax aware text objects
      { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'Comment.nvim' }, -- context-commentstring module for treesitter
      { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter', ft = {'md','vue','html','jsx','tsx'} }, -- auto complete HTML tags
      { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter', ft = {'fnl'} },
      { 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter' },
      { 'abecodes/tabout.nvim', config = [[require('tabout').setup()]], after = 'nvim-treesitter' }
    },
    event = 'BufRead',
    config = [[require('config.treesitter')]],
    run = ':TSUpdate' -- We recommend updating the parsers cmd update
  }
  use { 'tpope/vim-surround', keys = { {'v', 'S'}, 'y', 'c', 'd' } }
  use { 'tpope/vim-repeat', keys = '.' }
  use { 'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' } } -- gS for splitting & gJ for joining
  use { 'numToStr/Comment.nvim', config = [[require('Comment').setup()]], keys = { 'gb', 'gc', {'v','gb'}, {'v','gc'} } } -- Comment plugins with treesitter support
  use { 'windwp/nvim-autopairs', config = [[require('config.autopairs')]], event = 'InsertEnter *' } -- autopairs plugin
  use { 'andymass/vim-matchup', config = [[require('config.matchup')]], event = 'BufReadPost' } -- Replace default `matchit` & `matchparen`

  -- LSP & diagnostics
  use { 'neovim/nvim-lspconfig', config = [[require('lsp')]], event = 'BufReadPre', after = 'cmp-nvim-lsp' }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline' }
  use { 'folke/trouble.nvim', config = [[require('config.trouble')]], cmd = 'Trouble' }
  use { 'folke/lua-dev.nvim', module = 'lsp' }

  -- Completions
  use { 'hrsh7th/nvim-cmp', requires = {
      { 'hrsh7th/cmp-nvim-lsp',     event = 'BufReadPre' },
      { 'github/copilot.vim',       after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua',     after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path',         after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline',      after = 'nvim-cmp' },
      { 'hrsh7th/cmp-copilot',      after = 'nvim-cmp' },
      { 'andersevenrud/cmp-tmux',   after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'dmitmel/cmp-cmdline-history', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      { 'tzachar/cmp-fuzzy-buffer', requires = { 'tzachar/fuzzy.nvim' }, after = 'nvim-cmp' },
      { 'tzachar/cmp-tabnine', run = './install.sh', config = [[require('config.tabnine')]], after = 'nvim-cmp' }
    },
    after = { 'nvim-treesitter', 'friendly-snippets' },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  -- VCS
  use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]], event = 'BufReadPre' }
  use { 'TimUntersberger/neogit', config = [[require('config.neogit')]], wants = 'diffview.nvim', cmd = 'Neogit' }
  use { 'sindrets/diffview.nvim', config = [[require('config.diffview')]], cmd = 'DiffviewOpen' }
  use { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' }

  -- Snippets
  use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp', wants = { 'friendly-snippets' } }
  use { 'rafamadriz/friendly-snippets', event = 'BufReadPre' }

  -- Colorschemes
  use { 'kuntau/ayu-vim', branch = 'italic', opt = true }
  use { 'arcticicestudio/nord-vim', opt = true }
  use { 'NLKNguyen/papercolor-theme', opt = true }
  use { 'sainnhe/everforest', config = 'vim.g.everforest_background = hard', opt = true }
  use { 'rakr/vim-one', opt = true }
  use { 'catppuccin/nvim', as = 'catppuccin', config = [[require('config.catppuccin')]], opt = true }
  use { 'EdenEast/nightfox.nvim', config = [[require('config.nightfox')]], opt = true }
  use { 'marko-cerovac/material.nvim', config = 'vim.g.material_style = "palenight"', opt = true }
  use { 'folke/tokyonight.nvim' }
  use { 'rebelot/kanagawa.nvim', config = [[require'kanagawa'.setup{dimInactive = true, globalStatus = true }]] } -- tokyonight + gruvbox

  -- Qualify of life
  use { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }
  use { 'gennaro-tedesco/nvim-peekup', keys = [[""]] }
  use { 'numToStr/FTerm.nvim', config = [[require('FTerm').setup({cmd='/usr/local/bin/nu'})]], event = 'BufReadPost' }
  use { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }
  use { 'dstein64/vim-startuptime', config = 'vim.g.startuptime_tries = 5', cmd = 'StartupTime' } -- startup time benachmarking
  use { 'antoinemadec/FixCursorHold.nvim', config = 'vim.g.cursorhold_updatetime = 100', event = 'BufReadPre' } -- Fix CursorHold,CursorHoldI bug
  use { 'christoomey/vim-tmux-navigator', config = 'vim.g.tmux_navigator_disable_when_zoomed = 1', event = 'BufReadPost' }
  use { 'mtth/scratch.vim', config = [[vim.g.scratch_persistence_file = '.scratch']], cmd = { 'Scratch', 'ScratchSelection' } }
  use { 'mattn/vim-gist', config = [[vim.g.gist_clip_command=pbcopy vim.g.gist_detect_filetype=1]], cmd = { 'Gist' } }

  -- UI & UX
  use { 'kyazdani42/nvim-web-devicons' } -- for file icons
  use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent')]], cmd = 'IndentBlanklineEnable' }
  -- use { 'norcalli/nvim-colorizer.lua', config = [[require('colorizer').setup()]], ft = {'html', 'vue', 'css', 'jsx', 'tsx', 'scss', 'js', 'ts', 'haml', 'md', 'styl'} }
  use { 'RRethy/vim-hexokinase', run = 'make', event = 'BufReadPost' }
  use { 'norcalli/nvim-terminal.lua', config = [[require('terminal').setup()]], ft = 'terminal' }
  use { 'edluffy/specs.nvim', config = [[require('config.cursor')]], event = 'BufReadPre' }
  use { 'anuvyklack/pretty-fold.nvim', config = [[require('config.fold')]], event = 'BufReadPre' }

  -- StatusLine, bufferline & tabline
  use { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' } -- Tmux statusline
  use { 'nvim-lualine/lualine.nvim', config = [[require('config.statusline')]], event = 'User StartifyReady' } -- statusline

  -- Language specifics
  use { 'SidOfc/mkdx', ft = 'markdown', config = [[require('config.markdown')]] }
  -- use { 'LhKipp/nvim-nu', ft = 'nu', after = 'nvim-treesitter' } -- nu shell systax, TSInstall nu

  -- automatically setup configurations after cloning packer
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end
)
