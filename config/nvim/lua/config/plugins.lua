-- Lazy.nvim main plugins spec
-- Other plugins will be under `config/plugins/`

return {

  -- Essentials/Library
  { 'kuntau/vim-osc52', keys = { { '<c-c>', '<Plug>(YankOSC52)', mode='v', desc='Yank (OSC52)' } } }, -- Copy & paste across tmux & screen over mosh
  { 'stevearc/dressing.nvim', config = true, event = 'VeryLazy' }, -- Input library
  { 'rcarriga/nvim-notify', opts = { background_colour = '#000000' } }, -- Notifications library
  'MunifTanjim/nui.nvim', -- UI library
  'nvim-tree/nvim-web-devicons', -- for file icons
  'echasnovski/mini.icons', -- for file icons
  'nvim-lua/plenary.nvim', -- Utils/async library
  'tami5/sqlite.lua', -- SQLite library

  -- Movements
  { 'tummetott/unimpaired.nvim', event = 'VeryLazy', config = true },
  { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }, -- TODO: Replace with linty-org/readline.nvim
  { 'mg979/vim-visual-multi', keys = { { '<c-n>', mode = {'n','v'}, desc = 'Start multi-cursor' } } },

  -- Syntaxes and such
  { 'm-demare/hlargs.nvim', opts = {} }, -- Highlight arguments async
  { 'kylechui/nvim-surround', config = true, keys = { { 'S', mode = 'v' }, 'ys', 'cs', 'ds' } }, -- Better surround
  { 'tpope/vim-repeat', keys = { { '.', desc = 'REPEAT' } } },
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
  { 'folke/lazydev.nvim', ft = 'lua', opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } } },

  -- VCS
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', dependencies = 'rafamadriz/friendly-snippets' },

  -- Utilities
  'numToStr/FTerm.nvim',
  { 'jiaoshijie/undotree', opts = {} },
  { 'sedm0784/vim-resize-mode', event = 'WinNew' },
  { 'junegunn/vim-easy-align', keys = { { '<Enter>', '<Plug>(EasyAlign)', mode = 'v', desc = 'Easy align' }, { 'ga', '<Plug>(EasyAlign)', desc = 'Easy align' } } },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' }, -- startup time benachmarking
  { "Rawnly/gist.nvim", cmd = { "GistCreate", "GistCreateFromFile", "GistsList" }, config = true }, -- Required `gh` cli installed

  -- UI & UX
  { 'mvllow/modes.nvim', opts = {}, event = 'BufReadPost' },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', event = 'VeryLazy', config = true },
  { 'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = { preset = 'helix', show_help = false, show_keys = true },
    keys = { {
      "<Leader>?",
      function()
        require('which-key').show({ global = false })
      end,
      desc = "Buffer local mappings (which-key)"
    } },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.add({
        mode = { "n", "v" },
        { "=", group = "Yanky" },
        { "[", group = "Previous" },
        { "\\", group = "Local leader" },
        { "]", group = "Next" },
        { "g", group = "Go" },
        { "go", group = "Plugins" },
        { "gr", group = "Treesitter" },
        { "grr", desc = "Smart rename" },
        { "yo", group = "Unimpaired" },
        { "[o", group = "Unimpaired" },
        { "]o", group = "Unimpaired" },
        { "z", group = "Folds" },
        { "<Leader>", group = "Leader" },
        { "<Leader>d", group = "Debug" },
        { "<Leader>f", group = "Find" },
        { "<Leader>g", group = "Git" },
        { "<Leader>o", group = "Toggle" },
        { "<Leader>l", group = "LSP" },
        { "<Leader>lw", group = "LSP" },
        { "<Leader>r", group = "Reload" },
        { "<Leader>s", group = "Diagnostics" },
        { "<Leader>z", group = "Folds" },
      })
    end,
  }, -- Give key hint

  -- DX
  { 'folke/todo-comments.nvim', cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' }, config = true }, -- Highlight & find TODO
  { 'folke/twilight.nvim', cmd = 'Twilight', config = true }, -- Zen mode
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = true }, -- Zen mode

  -- Language specifics
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' }, -- Show hex color & More
  -- NOTE: Make terminal wonky on latest neovim, something todo with auto insert mode
  -- { 'boltlessengineer/bufterm.nvim', opts = { enable_ctrl_w = false }, event = 'TermOpen', enabled = true },
  { 'LhKipp/nvim-nu', name = 'nu', ft = 'nu', config = true, build = ':TSInstall nu' }, -- nu shell systax, TSInstall nu
  { 'fladson/vim-kitty', ft = 'kitty' }, -- kitty config syntax file

  -- TODO: Configure the following plugins

  -- Refactor
  -- 'cshuaimin/ssr.nvim', -- Structural Search and replace
  -- 'nvim-pack/nvim-spectre', -- Search and replace workflow
  -- 'ThePrimeagen/refactoring.nvim', -- Refactoring library

  -- Misc
  -- gen740/SmoothCursor.nvim
  -- rktjmp/paperplanes.nvim
  -- ThePrimeagen/harpoon
  -- LeonHeidelbach/trailblazer.nvim
}
