-- Lazy.nvim main plugins spec
-- Other plugins will be under `config/plugins/`

return {

  -- Essentials/Library
  { 'kuntau/vim-osc52', keys = { { '<c-c>', '<Plug>(YankOSC52)', mode='v', desc='Yank (OSC52)' } } }, -- Copy & paste across tmux & screen over mosh
  { 'stevearc/dressing.nvim', config = true, event = 'VeryLazy' }, -- Input library
  { 'rcarriga/nvim-notify', opts = { background_colour = '#000000' } }, -- Notifications library
  'MunifTanjim/nui.nvim', -- UI library
  'nvim-tree/nvim-web-devicons', -- for file icons
  'nvim-lua/plenary.nvim', -- Utils/async library
  'tami5/sqlite.lua', -- SQLite library

  -- Movements
  { 'tpope/vim-unimpaired', keys = { 'yo', '[', ']' } },
  { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }, -- TODO: Replace with linty-org/readline.nvim
  { 'mg979/vim-visual-multi', keys = { { '<c-n>', mode = {'n','v'}, desc = 'Start multi-cursor' } } },

  -- Syntaxes and such
  'ThePrimeagen/refactoring.nvim', -- Refactoring library
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
  { 'folke/neodev.nvim', ft = 'lua' },

  -- VCS
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp', dependencies = 'rafamadriz/friendly-snippets' },

  -- Utilities
  'numToStr/FTerm.nvim',
  { 'sedm0784/vim-resize-mode', event = 'WinNew' },
  { 'junegunn/vim-easy-align', keys = { { '<Enter>', '<Plug>(EasyAlign)', mode = 'v', desc = 'Easy align' }, { 'ga', '<Plug>(EasyAlign)', desc = 'Easy align' } } },
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' }, -- startup time benachmarking
  { "Rawnly/gist.nvim", cmd = { "GistCreate", "GistCreateFromFile", "GistsList" }, config = true }, -- Required `gh` cli installed
  { 'mtth/scratch.vim',
    keys = {
      { 'gos', '<cmd>Scratch<cr>', desc = 'Open Scratch' },
      { 'gos', '<cmd>ScratchSelection<cr>', mode = 'v', desc = 'Open Scratch with selections' }, -- BUG: didn't work
    },
    init = function()
      vim.g.scratch_persistence_file = '.scratch'
      vim.g.scratch_filetype = 'markdown'
      vim.g.scratch_height = 0.4
      vim.g.scratch_no_mappings = 1
    end,
  },

  -- UI & UX
  { 'mvllow/modes.nvim', opts = {}, event = 'BufReadPost' },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', event = 'VeryLazy', config = true },
  { 'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require('statuscol.builtin')
      require('statuscol').setup({
        setopt = true,
        relculright = true,
        thousands = ',',
        segments = {
          { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
          {
            text = { builtin.lnumfunc, ' ' },
            condition = { true, builtin.not_empty },
            click = 'v:lua.ScLa',
          },
          { text = { '%s' }, click = 'v:lua.ScSa' },
        },
      })
    end,
    event = 'VeryLazy',
    enabled = (vim.fn.has('nvim-0.10') == 1),
  },
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
        { "<Leader>f", group = "Telescope" },
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
  { 'boltlessengineer/bufterm.nvim', opts = { enable_ctrl_w = false }, event = 'TermOpen', enabled = true },
  { 'LhKipp/nvim-nu', name = 'nu', ft = 'nu', config = true, build = ':TSInstall nu' }, -- nu shell systax, TSInstall nu
  { 'MeanderingProgrammer/markdown.nvim', main = 'render-markdown', config = true, ft = 'markdown' },
  -- { 'OXY2DEV/markview.nvim', ft = 'markdown' }, -- TODO: Torned between this or `markdown.nvim`
  { 'fladson/vim-kitty', ft = 'kitty' }, -- kitty config syntax file

  -- TODO: Configure the following plugins

  -- Refactor
  'cshuaimin/ssr.nvim', -- Structural Search and replace
  'nvim-pack/nvim-spectre', -- Search and replace workflow

  -- Misc
  'toppair/peek.nvim', -- Markdown preview
  -- gen740/SmoothCursor.nvim
  -- rktjmp/paperplanes.nvim
  -- ThePrimeagen/harpoon
  -- LeonHeidelbach/trailblazer.nvim
}
