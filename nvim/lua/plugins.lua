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
-- vmap <c-c> <Plug>(YankOSC52)
Plug('mhinz/vim-startify')
Plug('mbbill/undotree', { on = 'UndotreeToggle' })
Plug('kyazdani42/nvim-tree.lua')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- Movements
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-rsi')
Plug('terryma/vim-multiple-cursors')
Plug('ggandor/lightspeed.nvim')

-- A solid language pack for Vim
-- Plug 'sheerun/vim-polyglot' -- Might not needed in favor of treesitter

-- Syntaxes and such
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })  -- We recommend updating the parsers on update
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('wellle/targets.vim') -- new text object
Plug('numToStr/Comment.nvim')
Plug('windwp/nvim-autopairs') -- autopairs plugin
Plug('AndrewRadev/splitjoin.vim') -- gS for splitting & gJ for joining

-- LSP & completions
Plug('neovim/nvim-lspconfig')
Plug('glepnir/lspsaga.nvim')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('tzachar/cmp-tabnine', { ['do'] = './install.sh' })
Plug('hrsh7th/nvim-cmp')
Plug('andersevenrud/cmp-tmux')

-- VCS
Plug('TimUntersberger/neogit')
Plug('lewis6991/gitsigns.nvim')

-- Diagnostics
Plug('folke/trouble.nvim')

-- Snippets
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('rafamadriz/friendly-snippets')

-- Colorschemes
Plug('folke/lsp-colors.nvim')
Plug('kuntau/ayu-vim', { branch = 'italic' })
Plug('gruvbox-community/gruvbox')
Plug('arcticicestudio/nord-vim')
Plug('rakr/vim-one')
Plug('catppuccin/nvim')
Plug('EdenEast/nightfox.nvim')

-- Misc bundle
Plug('christoomey/vim-tmux-navigator')
Plug('junegunn/vim-easy-align')

-- UI & UX
Plug('p00f/nvim-ts-rainbow')
Plug('norcalli/nvim-colorizer.lua')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('windwp/windline.nvim')
-- Plug('nvim-lualine/lualine.nvim')
Plug('kdheepak/tabline.nvim')
Plug('kyazdani42/nvim-web-devicons') -- for file icons
-- Plug('ryanoasis/vim-devicons') -- for file icons

vim.call('plug#end')

--[[ Plugins configuration ]]

-- UndoTree
vim.g.undotree_WindowsLayout = 2
-- nnoremap U :UndotreeToggle<CR>

require('Comment').setup() -- Comment.nvim setup
require('nvim-autopairs').setup() -- Autopairs
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
require('config.tabline')
require('config.statusline')
require('config.catppuccin')
