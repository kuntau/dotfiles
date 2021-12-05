if vim.fn.empty(vim.fn.glob('~/.vim/autoload/plug.vim')) ~= 0 then
  vim.cmd [[
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

-- Movements
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-rsi')
Plug('terryma/vim-multiple-cursors')

-- A solid language pack for Vim
-- Plug 'sheerun/vim-polyglot'

-- Syntaxes and such
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })  -- We recommend updating the parsers on update
Plug('tpope/vim-surround')
Plug('tpope/vim-repeat')
Plug('wellle/targets.vim') -- new text object
Plug('numToStr/Comment.nvim')
Plug('windwp/nvim-autopairs') -- autopairs plugin

-- LSP & completions
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('wellle/tmux-complete.vim')

-- VCS
Plug('TimUntersberger/neogit')
Plug('lewis6991/gitsigns.nvim')

-- Snippets
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('rafamadriz/friendly-snippets')

-- Colorschemes
Plug('kuntau/ayu-vim', { branch = 'italic' })
Plug('gruvbox-community/gruvbox')
Plug('arcticicestudio/nord-vim')
Plug('rakr/vim-one')
Plug('catppuccin/nvim')

-- Misc bundle
Plug('christoomey/vim-tmux-navigator')
Plug('junegunn/vim-easy-align')

-- UI & UX
Plug('ggandor/lightspeed.nvim')
Plug('p00f/nvim-ts-rainbow')
Plug('norcalli/nvim-colorizer.lua')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('kyazdani42/nvim-web-devicons') -- for file icons

vim.call('plug#end')

--[[ Plugins configuration ]]

-- UndoTree
vim.g.undotree_WindowsLayout = 2
-- nnoremap U :UndotreeToggle<CR>

require('nvim-tree').setup() -- nvim-tree
require('telescope').setup() -- telescope
require('Comment').setup() -- Comment.nvim setup
require('nvim-autopairs').setup() -- Autopairs
require('colorizer').setup()
require('neogit').setup({
  commit_popup = {
    kind = "split"
  },
  kind = "split_above",
})
require("indent_blankline").setup({
  show_current_context = true,
  -- show_current_context_start = true
})
require('catppuccin').setup({
  integrations = {
    telescope = true,
    neogit = true,
    gitsigns = true,
    lightspeed = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true
    },
    nvimtree = {
      enabled = true,
      show_root = true
    }
  }
})

require('config.lsp')
require('config.nvim-cmp')
require('config.treesitter')
require('config.startify')
require('config.gitsigns')

