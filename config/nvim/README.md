
    ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
    ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
    ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
    ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
    ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
    ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


    █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀
    █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█
## Active


| { 'kuntau/vim-osc52', keys = '<c-c>' }, -- Copy & paste across tmux & screen over mosh
| { 'tpope/vim-unimpaired', keys = { 'yo', '[', ']' } },
| { 'tpope/vim-rsi', event = { 'InsertEnter *', 'CmdlineEnter' } }, -- TODO: Replace with linty-org/readline.nvim
| { 'mg979/vim-visual-multi', keys = '<c-n>' },
| { 'kylechui/nvim-surround', config = true, keys = { { 'S', mode = 'v' }, 'ys', 'cs', 'ds' } }, -- Better surround
| { 'tpope/vim-repeat', keys = '.' },
| { 'Wansmer/treesj', cmd = { 'TSJJoin', 'TSJSplit', 'TSJToggle' }, config = { use_default_keymaps = false, max_join_length = 500 }, }, -- Splitjoin successor, require TS.
| { 'kevinhwang91/nvim-bqf', ft = 'qf' },
| { 'simrat39/symbols-outline.nvim', config = true, cmd = 'SymbolsOutline' },
| { 'folke/trouble.nvim', config = true, cmd = 'Trouble' },
| { 'folke/neodev.nvim', ft = 'lua' },
| { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },
| { 'L3MON4D3/LuaSnip', dependencies = 'rafamadriz/friendly-snippets' },
| 'numToStr/FTerm.nvim',
| { 'junegunn/vim-easy-align', cmd = 'EasyAlign' },
| { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = function() vim.g.startuptime_tries = 5 end, }, -- startup time benachmarking
| { 'mattn/vim-gist', cmd = { 'Gist' }, config = function() vim.g.gist_clip_command = 'pbcopy' vim.g.gist_detect_filetype = 1 end },
| { 'mtth/scratch.vim', cmd = { 'Scratch', 'ScratchSelection' }, config = function() vim.g.scratch_persistence_file = '.scratch' end },
| 'MunifTanjim/nui.nvim', -- UI library
| 'kyazdani42/nvim-web-devicons', -- for file icons
| 'rcarriga/nvim-notify', -- Beautiful notifications
| { 'anuvyklack/pretty-fold.nvim', config = true, keys = { 'zc' } },
| { 'folke/which-key.nvim', config = { show_help = false, show_keys = false }, event = 'BufReadPost' }, -- Give key hint
| { 'folke/todo-comments.nvim', cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' }, config = true }, -- Highlight & find TODO
| { 'folke/twilight.nvim', cmd = 'Twilight', config = true }, -- Zen mode
| { 'folke/zen-mode.nvim', cmd = 'ZenMode', config = true }, -- Zen mode
| { 'RRethy/vim-hexokinase', build = 'make', event = 'BufReadPost' }, -- Show hex color & More
| { 'norcalli/nvim-terminal.lua', config = true, event = 'TermOpen' },
| { 'LhKipp/nvim-nu', ft = 'nu', config = function() require('nu').setup({ }) end, build = 'TSInstall nu' }, -- nu shell systax, TSInstall nu
| { 'lukas-reineke/headlines.nvim', ft = { 'markdown', 'norg' }, config = true },
| 'ThePrimeagen/refactoring.nvim', -- Refactoring library
| 'm-demare/hlargs.nvim', -- Highlight arguments async
| 'cshuaimin/ssr.nvim', -- Structural Search and replace
| 'nvim-pack/nvim-spectre', -- Search and replace workflow
| 'pwntester/octo.nvim', -- Manage github issues in Neovim
| 'rlch/github-notifications.nvim', -- As the name suggest
| 'toppair/peek.nvim', -- Markdown preview
| 'kevinhwang91/nvim-ufo', -- Folding
| 'kevinhwang91/nvim-hlslens', -- Hl Search lens
| 'mbbill/undotree',
| { 'nvim-lualine/lualine.nvim', event = 'BufReadPost', config = config },
| { 'edkolev/tmuxline.vim', cmd = 'Tmuxline' }, -- Tmux statusline
| 'ggandor/leap.nvim',
| 'ggandor/flit.nvim',
| 'mhinz/vim-startify',
| { 'anuvyklack/windows.nvim',
| { 'kazhala/close-buffers.nvim', cmd = { 'BDelete', 'BWipeout' } }, -- TODO: Replace with mini.bufremove
| { 'christoomey/vim-tmux-navigator',
| { 'nvim-treesitter/nvim-treesitter', dependencies = {
| 'nvim-treesitter/nvim-treesitter-refactor', -- Refactor module for treesitter
| 'nvim-treesitter/nvim-treesitter-textobjects', -- Syntax aware text-objects, select, move, swap
| 'RRethy/nvim-treesitter-textsubjects', -- Location and syntax aware text objects
| { 'nvim-treesitter/nvim-treesitter-context', config = true }, -- Show code context
| { 'windwp/nvim-ts-autotag', ft = {'markdown','vue','html','jsx','tsx'} }, -- auto complete HTML tags
| { 'p00f/nvim-ts-rainbow' }, -- TS powered rainbow brackets
| { 'abecodes/tabout.nvim', config = true, event = 'InsertEnter *.*' }, -- TS - easy exit in params
| 'TimUntersberger/neogit',
| { 'hrsh7th/nvim-cmp', dependencies = {
| 'hrsh7th/cmp-nvim-lua',
| 'hrsh7th/cmp-path',
| 'andersevenrud/cmp-tmux',
| 'saadparwaiz1/cmp_luasnip',
| 'hrsh7th/cmp-nvim-lsp-document-symbol',
| { 'hrsh7th/cmp-nvim-lsp', event = 'BufReadPost' },
| { 'tzachar/cmp-tabnine', build = './install.sh', config = config_tabnine }
| { 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
| { 'dmitmel/cmp-cmdline-history', event = 'CmdlineEnter' },
| { 'tzachar/cmp-fuzzy-buffer', event = 'CmdlineEnter', dependencies = 'tzachar/fuzzy.nvim' },
| 'kyazdani42/nvim-tree.lua',
| 'numToStr/Comment.nvim',
| dependencies = 'JoosepAlviste/nvim-ts-context-commentstring', -- context-commentstring module for treesitter
| 'lewis6991/gitsigns.nvim',
| 'gbprod/yanky.nvim',
| 'neovim/nvim-lspconfig',
| 'williamboman/mason.nvim',
| 'williamboman/mason-lspconfig.nvim',
| { 'SmiteshP/nvim-navic', config = { highlight = true } }, -- Show LSP context on statusline
| { 'jose-elias-alvarez/null-ls.nvim', config = config_null }, -- Bridge LSP
| 'mfussenegger/nvim-dap',
| { 'rcarriga/nvim-dap-ui', config = function () require('dapui').setup() end },
| { 'michaelb/sniprun',
| 'sindrets/diffview.nvim',
| 'NLKNguyen/papercolor-theme',
| 'arcticicestudio/nord-vim',
| 'folke/tokyonight.nvim',
| 'nyoom-engineering/oxocarbon.nvim', -- IBM carbon inspired
| 'NTBBloodbath/doom-one.nvim',
| { 'rakr/vim-one', config = function() vim.g.one_allow_italics = 1 end },
| { 'EdenEast/nightfox.nvim', config = config_nightfox },
| { 'catppuccin/nvim', name = 'catppuccin', config = config_catpuccin },
| { 'kuntau/ayu-vim', branch = 'italic', config = config_ayu },
| { 'marko-cerovac/material.nvim', config = config_material },
| { 'rebelot/kanagawa.nvim', config = { dimInactive = true, globalStatus = true } }, -- tokyonight + gruvbox
| { 'sainnhe/everforest', config = function() vim.g.everforest_background = 'hard' end },
| 'nvim-telescope/telescope.nvim',
| 'nvim-lua/plenary.nvim',
| 'nvim-telescope/telescope-fzf-native.nvim',
| 'nvim-telescope/telescope-smart-history.nvim',
| 'nvim-telescope/telescope-frecency.nvim',
| dependencies = 'tami5/sqlite.lua',
| 'nvim-telescope/telescope-ui-select.nvim',
| 'nvim-telescope/telescope-project.nvim',
| 'ahmedkhalf/project.nvim',
| 'monaqa/dial.nvim',
| 'windwp/nvim-autopairs',
| 'andymass/vim-matchup',
| 'lukas-reineke/indent-blankline.nvim',
| 'edluffy/specs.nvim',
| 'SidOfc/mkdx',
| 'folke/noice.nvim',
| 'hrsh7th/cmp-nvim-lsp-signature-help ',

## Removed
## Disabled
| -- { 'stevearc/dressing.nvim', config = true, event = 'BufReadPost' }, -- use telescope-ui-select for now
## Replaced

- `tpope/vim-surround` -> `kylechui/nvim-surround`
