-- Plugins with packer.nvim

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
  { 'AndrewRadev/splitjoin.vim', cmd = { 'SplitjoinJoin', 'SplitjoinSplit' } }, -- gS for splitting & gJ for joining. TODO: Replace with Wansmer/treesj

  -- LSP & diagnostics
  { 'neovim/nvim-lspconfig', config = function() require('lsp') end, event = 'BufReadPre' },
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
  { 'numToStr/FTerm.nvim' },
  { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
  { 'dstein64/vim-startuptime', config = function() vim.g.startuptime_tries = 5 end, cmd = 'StartupTime' }, -- startup time benachmarking
  { 'christoomey/vim-tmux-navigator', config = function() vim.g.tmux_navigator_disable_when_zoomed = 1 end, keys = { '<c-k>', '<c-j>', '<c-h>', '<c-l>' } },
  { 'mtth/scratch.vim', config = function() vim.g.scratch_persistence_file = '.scratch' end, cmd = { 'Scratch', 'ScratchSelection' } },
  { 'lewis6991/spellsitter.nvim', config = true },
  { 'mattn/vim-gist', config = function() vim.g.gist_clip_command='pbcopy' vim.g.gist_detect_filetype=1 end, cmd = { 'Gist' } },

  -- UI & UX
  { 'kyazdani42/nvim-web-devicons' }, -- for file icons
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' },
  { 'norcalli/nvim-terminal.lua', config = true, ft = 'terminal' },
  { 'anuvyklack/pretty-fold.nvim', config = true, keys = { 'zc' } },

  -- StatusLine, bufferline & tabline
  { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' }, -- Tmux statusline

  -- Language specifics
  { 'LhKipp/nvim-nu', ft = 'nu', config = function() require('nu').setup() end, build = 'TSInstall nu' }, -- nu shell systax, TSInstall nu
}
