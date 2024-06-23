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
  { 'mattn/vim-gist', cmd = { 'Gist' }, config = function() vim.g.gist_clip_command = 'pbcopy' vim.g.gist_detect_filetype = 1 end },
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
    branch = '0.10',
    config = function()
      local builtin = require('statuscol.builtin')
      require('statuscol').setup({
        setopt = true,
        relculright = true,
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
    enabled = (vim.fn.has('nvim-0.9') == 1),
  },
  { 'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = { show_help = false, show_keys = true, triggers_blacklist = { n = { 'd', 'y' } } },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.register({
        mode = { 'n', 'v' },
        ['g'] = { name = 'Go' },
        ['z'] = { name = 'Folds' },
        ['='] = { name = 'Yanky' },
        [']'] = { name = 'Next' },
        ['['] = { name = 'Previous' },
        ['go'] = { name = 'Plugins' },
        ['gr'] = { name = 'Treesitter' },
        ['\\'] = { name = 'Local leader' },
        ['grr'] = 'Smart rename',
        ['<Leader>'] = { name = 'Leader' },
        ['<Leader>f'] = { name = 'Telescope' },
        ['<Leader>d'] = { name = 'Debug' },
        ['<Leader>l'] = { name = 'LSP' },
        ['<Leader>s'] = { name = 'Diagnostics' },
        ['<Leader>r'] = { name = 'Reload' },
        ['<Leader>lw'] = { name = 'LSP' },
      })
    end,
  }, -- Give key hint

  -- DX
  { 'folke/todo-comments.nvim', cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' }, config = true }, -- Highlight & find TODO
  { 'folke/twilight.nvim', cmd = 'Twilight', config = true }, -- Zen mode
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = true }, -- Zen mode

  -- Language specifics
  { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' }, -- Show hex color & More
  { 'norcalli/nvim-terminal.lua', event = 'TermOpen', enabled = false },
  { 'boltlessengineer/bufterm.nvim', opts = { enable_ctrl_w = false }, event = 'TermOpen', enabled = true },
  { 'LhKipp/nvim-nu', name = 'nu', ft = 'nu', config = true, build = ':TSInstall nu' }, -- nu shell systax, TSInstall nu
  { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'norg' }, config = true, opts = { markdown = { fat_headlines = false } } },
  { 'fladson/vim-kitty', ft = 'kitty' }, -- nu shell systax, TSInstall nu

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
