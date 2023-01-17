-- Lazy.nvim main plugins spec
-- Other plugins will be under `config/plugins/`

return {

  -- Essentials
  { 'kuntau/vim-osc52', keys = { { '<c-c>', '<Plug>(YankOSC52)', mode='v', desc='Yank OSC52' } } }, -- Copy & paste across tmux & screen over mosh

  -- Movements
  { 'tpope/vim-unimpaired', keys = { 'yo', '[', ']' } },
  { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }, -- TODO: Replace with linty-org/readline.nvim
  { 'mg979/vim-visual-multi', keys = '<c-n>' },

  -- Syntaxes and such
  { 'kylechui/nvim-surround', config = true, keys = { { 'S', mode = 'v' }, 'ys', 'cs', 'ds' } }, -- Better surround
  { 'tpope/vim-repeat', keys = '.' },
  { 'Wansmer/treesj', -- Splitjoin successor, require TS.
    keys = {
      { 'gJ', '<cmd>TSJJoin<cr>', desc = 'TSJ join line' },
      { 'gS', '<cmd>TSJSplit<cr>', desc = 'TSJ split line' },
      { 'gG', '<cmd>TSJToggle<cr>', desc = 'TSJ toggle line' },
    },
    opts = { use_default_keymaps = false, max_join_length = 500 },
  },

  -- Diagnostics
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  { 'simrat39/symbols-outline.nvim', config = true, cmd = 'SymbolsOutline' },
  { 'folke/trouble.nvim', config = true, cmd = 'Trouble' },
  { 'folke/neodev.nvim', ft = 'lua' },

  -- VCS
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },

  -- Utilities
  'numToStr/FTerm.nvim',
  { 'junegunn/vim-easy-align', keys = { { '<Enter>', '<Plug>(EasyAlign)', mode = 'v', desc = 'Easy align' }, { 'ga', '<Plug>(EasyAlign)', desc = 'Easy align' } } },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' }, -- startup time benachmarking
  { 'mattn/vim-gist', cmd = { 'Gist' }, config = function() vim.g.gist_clip_command = 'pbcopy' vim.g.gist_detect_filetype = 1 end },
  { 'mtth/scratch.vim', cmd = { 'Scratch', 'ScratchSelection' }, config = function() vim.g.scratch_persistence_file = '.scratch' end },

  -- UI & UX
  'MunifTanjim/nui.nvim', -- UI library
  'kyazdani42/nvim-web-devicons', -- for file icons
  'rcarriga/nvim-notify', -- Beautiful notifications
  { 'anuvyklack/pretty-fold.nvim', config = true, keys = { 'zc' } },
  { 'folke/which-key.nvim', opts = { plugins = { spelling = { enabled = true } }, show_help = false, show_keys = true }, event = 'BufReadPost' }, -- Give key hint
  -- { 'stevearc/dressing.nvim', config = true, event = 'BufReadPost' }, -- use telescope-ui-select for now

  -- DX
  { 'folke/todo-comments.nvim', cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' }, config = true }, -- Highlight & find TODO
  { 'folke/twilight.nvim', cmd = 'Twilight', config = true }, -- Zen mode
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = true }, -- Zen mode

  -- Language specifics
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' }, -- Show hex color & More
  { 'norcalli/nvim-terminal.lua', config = true, event = 'TermOpen' },
  { 'LhKipp/nvim-nu', name = 'nu', ft = 'nu', config = true, build = 'TSInstall nu' }, -- nu shell systax, TSInstall nu
  { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'norg' }, config = true },

  -- TODO: Configure the following plugins

  -- Refactor
  'ThePrimeagen/refactoring.nvim', -- Refactoring library
  'm-demare/hlargs.nvim', -- Highlight arguments async
  'cshuaimin/ssr.nvim', -- Structural Search and replace
  'nvim-pack/nvim-spectre', -- Search and replace workflow

  -- Misc
  'pwntester/octo.nvim', -- Manage github issues in Neovim
  'rlch/github-notifications.nvim', -- As the name suggest
  'toppair/peek.nvim', -- Markdown preview
  'kevinhwang91/nvim-ufo', -- Folding
  'kevinhwang91/nvim-hlslens', -- Hl Search lens
}
