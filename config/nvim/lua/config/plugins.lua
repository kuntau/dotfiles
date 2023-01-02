-- Lazy.nvim main plugins spec
-- Other plugins will be under `config/plugins/`

return {

  -- Essentials
  { 'kuntau/vim-osc52', keys = '<c-c>' }, -- Copy & paste across tmux & screen over mosh

  -- Movements
  { 'tpope/vim-unimpaired', keys = { 'yo', '[', ']' } },
  { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }, -- TODO: Replace with linty-org/readline.nvim
  { 'mg979/vim-visual-multi', keys = '<c-n>'  },

  -- Syntaxes and such
  { 'tpope/vim-surround', keys = { { 'S', mode = 'v' }, 'ys', 'cs', 'ds' } }, -- TODO: Replace with mini.surround
  { 'tpope/vim-repeat', keys = '.' },
  { 'Wansmer/treesj', cmd = { 'TSJJoin', 'TSJSplit', 'TSJToggle' }, config = true }, -- Splitjoin successor, require TS.

  -- LSP
  { 'neovim/nvim-lspconfig', config = function() require('lsp') end, event = 'BufReadPre' },
  { 'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true,
    dependencies = { 'williamboman/mason-lspconfig.nvim', config = { automatic_installation = true } }, -- Bridge for mason-LSP config
  }, -- Auto/manage LSP
  { 'SmiteshP/nvim-navic', config = { highlight = true } },

  -- Diagnostics
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  { 'simrat39/symbols-outline.nvim', config = true, cmd = 'SymbolsOutline' },
  { 'folke/trouble.nvim', config = true, cmd = 'Trouble' },
  { 'folke/neodev.nvim', ft = 'lua' },

  -- VCS
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },

  -- Qualify of life
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' },
  { 'gennaro-tedesco/nvim-peekup', keys = [[""]] }, -- TODO: Replace with AckslD/nvim-neoclip.lua

  -- Utilities
  'numToStr/FTerm.nvim',
  { 'dstein64/vim-startuptime', config = function() vim.g.startuptime_tries = 5 end, cmd = 'StartupTime' }, -- startup time benachmarking
  { 'mattn/vim-gist', config = function() vim.g.gist_clip_command='pbcopy' vim.g.gist_detect_filetype=1 end, cmd = { 'Gist' } },
  { 'mtth/scratch.vim', config = function() vim.g.scratch_persistence_file = '.scratch' end, cmd = { 'Scratch', 'ScratchSelection' } },

  -- UI & UX
  'MunifTanjim/nui.nvim', -- UI library
  'kyazdani42/nvim-web-devicons', -- for file icons
  'rcarriga/nvim-notify', -- Beautiful notifications
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' }, -- Show hex color & More
  { 'norcalli/nvim-terminal.lua', config = true, ft = 'terminal' },
  { 'anuvyklack/pretty-fold.nvim', config = true, keys = { 'zc' } },
  { 'folke/which-key.nvim', config = true, event = 'BufReadPost' } , -- Give key hint

  -- DX
  { 'folke/todo-comments.nvim', cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' }, config = true }, -- Highlight & find TODO
  { 'folke/twilight.nvim', cmd = 'Twilight', config = true }, -- Zen mode
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = true }, -- Zen mode

  -- Language specifics
  { 'LhKipp/nvim-nu', ft = 'nu', config = function() require('nu').setup({}) end, build = 'TSInstall nu' }, -- nu shell systax, TSInstall nu

  -- TODO: Configure the following plugins

  -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- Bridge LSP
  'mfussenegger/nvim-lint', -- Linter
  'mhartington/formatter.nvim', -- Formatter

  -- Refactor
  'ThePrimeagen/refactoring.nvim', -- Refactoring library
  'm-demare/hlargs.nvim', -- Highlight arguments async
  'cshuaimin/ssr.nvim', -- Structural Search and replace
  'nvim-pack/nvim-spectre', -- Search and replace workflow

  -- Misc
  'pwntester/octo.nvim', -- Manage github issues in Neovim
  'rlch/github-notifications.nvim', -- As the name suggest
  'toppair/peek.nvim', -- Markdown preview
  'gbprod/yanky.nvim', -- Kill-ring like feature, maybe neoclip is better
  'AckslD/nvim-neoclip.lua', -- sqlite powered clipboard manager
  'kevinhwang91/nvim-ufo', -- Folding
  'kevinhwang91/nvim-hlslens', -- Hl Search lens
}
