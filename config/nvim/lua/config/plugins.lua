-- Plugins with packer.nvim

return {

  -- dev
  -- if fn.isdirectory(fn.glob('~/coding/vim/unimpaired.nvim')) == 1 then
  --   use { '~/coding/vim/unimpaired.nvim', disable = true }
  -- end

  -- Essentials
  { 'kuntau/vim-osc52', keys = '<c-c>' }, -- Copy & paste across tmux & screen over mosh
  { 'kyazdani42/nvim-tree.lua', config = function() require('config.nvimtree') end, cmd = 'NvimTreeToggle' },
  { 'mbbill/undotree', config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_HelpLine = 0
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_TreeNodeShape = '⧂'
    vim.g.undotree_TreeVertShape = '│'
    vim.g.undotree_TreeSplitShape = '╱'
    vim.g.undotree_TreeReturnShape = '╲'
    vim.g.undotree_SetFocusWhenToggle = 1
  end,  cmd = 'UndotreeToggle' },
    -- vim.g.undotree_TreeNodeShape = '●'
  { 'nvim-telescope/telescope.nvim', dependencies = {
  -- { dir = '~/coding/forks/telescope.nvim', dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', config = function() require('telescope').load_extension('fzf') end, build = 'make' },
        { 'nvim-telescope/telescope-frecency.nvim', config = function() require('telescope').load_extension('frecency') end, dependencies = 'tami5/sqlite.lua' },
        { 'ahmedkhalf/project.nvim', config = function() require('project_nvim').setup() require('telescope').load_extension('projects') end, },
    },
    dev = true,
    config = function() require('config._telescope') end,
    cmd = 'Telescope',
  },
  { 'mhinz/vim-startify', config = function() require('config.homepage').startify() end, cmd = 'Startify' }, -- TODO: Replace with mini.starter & mini.session

  -- Movements
  { 'tpope/vim-unimpaired', event = 'BufReadPost' },
  { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } },
  { 'mg979/vim-visual-multi', keys = '<c-n>'  },

  -- Syntaxes and such
  { 'nvim-treesitter/nvim-treesitter', dependencies = {
        { 'nvim-treesitter/nvim-treesitter-refactor' }, -- Refactor module for treesitter
        { 'nvim-treesitter/nvim-treesitter-textobjects' }, -- text-objects module for treesitter
        { 'RRethy/nvim-treesitter-textsubjects' }, -- Location and syntax aware text objects
        { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- context-commentstring module for treesitter
        { 'windwp/nvim-ts-autotag', ft = {'md','vue','html','jsx','tsx'} }, -- auto complete HTML tags
        { 'p00f/nvim-ts-rainbow', ft = {'fnl'} },
        { 'romgrk/nvim-treesitter-context' },
        { 'abecodes/tabout.nvim', config = true }
    },
    event = 'BufReadPost',
    config = function() require('config.treesitter') end,
    build = ':TSUpdate' -- We recommend updating the parsers cmd update
  },
  { 'tpope/vim-surround', keys = { { 'S', mode = 'v' }, 'y', 'c', 'd' } }, -- TOOD: Replace with mini.surround
  { 'tpope/vim-repeat', keys = '.' },
  { 'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' } }, -- gS for splitting & gJ for joining
  { 'numToStr/Comment.nvim', config = function() require('config.comment') end, keys = { 'gb', 'gc' } }, -- Comment plugins with treesitter support
  { 'windwp/nvim-autopairs', config = function() require('config.autopairs') end, event = 'InsertEnter *' }, -- autopairs plugin
  { 'andymass/vim-matchup', config = function() require('config.matchup') end, event = 'BufReadPost' }, -- Replace default `matchit` & `matchparen`

  -- LSP & diagnostics
  { 'neovim/nvim-lspconfig', config = function() require('lsp') end, event = 'BufReadPre' },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline' },
  { 'folke/trouble.nvim', config = function() require('config.trouble') end, cmd = 'Trouble' },
  { 'folke/neodev.nvim', ft = 'lua' },

  -- Completions
  { 'hrsh7th/nvim-cmp', dependencies = {
        { 'hrsh7th/cmp-nvim-lsp', event = 'BufReadPost' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'andersevenrud/cmp-tmux' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'dmitmel/cmp-cmdline-history' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
        { 'tzachar/cmp-fuzzy-buffer', dependencies = { 'tzachar/fuzzy.nvim' }, },
        { 'tzachar/cmp-tabnine', build = './install.sh', config = function() require('config.tabnine') end, }
    },
    config = function() require('config.cmp') end,
    event = 'InsertEnter *',
  },

  -- VCS
  { 'lewis6991/gitsigns.nvim', config = function() require('config.gitsigns') end, event = 'BufReadPost' },
  { 'TimUntersberger/neogit', config = function() require('config.neogit') end, dependencies = 'sindrets/diffview.nvim', cmd = 'Neogit' },
  { 'sindrets/diffview.nvim', config = function() require('config.diffview') end, cmd = 'DiffviewOpen' },
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },

  -- Colorschemes
  { 'kuntau/ayu-vim', branch = 'italic' },
  { 'arcticicestudio/nord-vim' },
  { 'NLKNguyen/papercolor-theme' },
  { 'sainnhe/everforest', config = function() vim.g.everforest_background = 'hard' end },
  { 'rakr/vim-one' },
  { 'catppuccin/nvim', name = 'catppuccin', config = function() require('config.catppuccin') end },
  { 'EdenEast/nightfox.nvim', config = function() require('config.nightfox') end },
  { 'marko-cerovac/material.nvim', config = function() vim.g.material_style = "palenight" end },
  { 'folke/tokyonight.nvim' },
  { 'rebelot/kanagawa.nvim', config = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox

  -- Qualify of life
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' },
  { 'gennaro-tedesco/nvim-peekup', keys = [[""]] },
  { 'numToStr/FTerm.nvim' },
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  { 'dstein64/vim-startuptime', config = function() vim.g.startuptime_tries = 5 end, cmd = 'StartupTime' }, -- startup time benachmarking
  { 'christoomey/vim-tmux-navigator', config = function() vim.g.tmux_navigator_disable_when_zoomed = 1 end, event = 'BufReadPost' },
  { 'mtth/scratch.vim', config = function() vim.g.scratch_persistence_file = '.scratch' end, cmd = { 'Scratch', 'ScratchSelection' } },
  { 'lewis6991/spellsitter.nvim', config = true },
  { 'mattn/vim-gist', config = function() vim.g.gist_clip_command='pbcopy' vim.g.gist_detect_filetype=1 end, cmd = { 'Gist' } },

  -- UI & UX
  { 'kyazdani42/nvim-web-devicons' }, -- for file icons
  { 'lukas-reineke/indent-blankline.nvim', config = function() require('config.indent') end, cmd = 'IndentBlanklineEnable' },
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' },
  { 'norcalli/nvim-terminal.lua', config = true, ft = 'terminal' },
  { 'edluffy/specs.nvim', config = function() require('config.cursor') end, event = 'BufReadPre' },
  { 'anuvyklack/pretty-fold.nvim', config = function() require('config.fold') end, event = 'BufReadPre' },

  -- StatusLine, bufferline & tabline
  { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' }, -- Tmux statusline
  { 'nvim-lualine/lualine.nvim', config = function() require('config.statusline') end, event = 'VeryLazy' }, -- statusline

  -- Language specifics
  { 'SidOfc/mkdx', ft = 'markdown', config = function() require('config.markdown') end }
  -- use { 'LhKipp/nvim-nu', ft = 'nu', after = 'nvim-treesitter' } -- nu shell systax, TSInstall nu
}
