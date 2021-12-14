if vim.fn.empty(vim.fn.glob('~/.local/share/nvim/site/autoload/plug.vim')) ~= 0 then
  vim.cmd [[
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim 
    \ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  ]]
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/bundle')

Plug('junegunn/fzf', {
	dir = '~/.fzf',
	['do'] = './install --all'
})

-- Essentials
Plug('nvim-lua/plenary.nvim')
Plug('kuntau/vim-osc52')
Plug('mhinz/vim-startify')
Plug('mbbill/undotree', { on = 'UndotreeToggle' })
Plug('kyazdani42/nvim-tree.lua')
Plug('nvim-telescope/telescope.nvim')

-- Movements
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-rsi')
Plug('ggandor/lightspeed.nvim')
Plug('mg979/vim-visual-multi')

-- Syntaxes and such
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })  -- We recommend updating the parsers on update
Plug('nvim-treesitter/nvim-treesitter-refactor')  -- Refactor module for treesitter
Plug('nvim-treesitter/nvim-treesitter-textobjects')  -- text-objects module for treesitter
Plug('JoosepAlviste/nvim-ts-context-commentstring') -- context-commentstring module for treesitter
Plug('windwp/nvim-ts-autotag') -- auto complete HTML tags
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('numToStr/Comment.nvim') -- Comment plugins with treesitter support
Plug('windwp/nvim-autopairs') -- autopairs plugin
Plug('AndrewRadev/splitjoin.vim') -- gS for splitting & gJ for joining

-- LSP & diagnostics
Plug('neovim/nvim-lspconfig')
Plug('folke/trouble.nvim')
Plug('kevinhwang91/nvim-bqf')
-- Plug('ray-x/navigator.lua')
-- Plug('glepnir/lspsaga.nvim')

-- Completions
Plug('github/copilot.vim')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-copilot')
Plug('tzachar/cmp-tabnine', { ['do'] = './install.sh' })
Plug('andersevenrud/cmp-tmux')
Plug('hrsh7th/nvim-cmp')

-- VCS
Plug('TimUntersberger/neogit')
Plug('lewis6991/gitsigns.nvim')
Plug('sindrets/diffview.nvim')

-- Snippets
Plug('saadparwaiz1/cmp_luasnip')
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')

-- Colorschemes
Plug('folke/lsp-colors.nvim')
Plug('kuntau/ayu-vim', { branch = 'italic' })
Plug('gruvbox-community/gruvbox')
Plug('arcticicestudio/nord-vim')
Plug('rakr/vim-one')
Plug('catppuccin/nvim')
Plug('EdenEast/nightfox.nvim')
Plug('NLKNguyen/papercolor-theme')
Plug('joshdick/onedark.vim')

-- Misc bundle
Plug('christoomey/vim-tmux-navigator')
Plug('junegunn/vim-easy-align')
Plug('ahmedkhalf/project.nvim')

-- UI & UX
-- Plug('ray-x/guihua.lua', { ['do'] = 'cd lua/fzy && make' })
Plug('p00f/nvim-ts-rainbow')
Plug('norcalli/nvim-colorizer.lua')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('kyazdani42/nvim-web-devicons') -- for file icons
Plug('onsails/lspkind-nvim') -- LSP completion menu icons
Plug('famiu/bufdelete.nvim') -- improve :bdelete experience
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- StatusLine, bufferline & tabline
Plug('kdheepak/tabline.nvim')
Plug('nvim-lualine/lualine.nvim') -- statusline
-- Plug('famiu/feline.nvim') -- statusline
-- Plug('windwp/windline.nvim') -- statusline

vim.call('plug#end')

--[[ Plugins configuration ]]--

-- UndoTree
vim.g.undotree_WindowsLayout = 2

require('Comment').setup() -- Comment.nvim setup
require('colorizer').setup()

require('config.lsp')
require('config.cmp')
require('config.tabnine')
require('config.neogit')
require('config.telescope')
require('config.treesitter')
require('config.nvimtree')
require('config.startify')
require('config.gitsigns')
require('config.trouble')
require('config.indent')
require('config.statusline')
require('config.catppuccin')
require('config.diffview')
require('config.tabline')
require('config.project')
require('config.autopairs')
