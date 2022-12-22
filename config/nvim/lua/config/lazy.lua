-- lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[\]]

-- load lazy
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "nightfox", "habamax" } },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
  dev = {
    path = "~/coding/forks"
  }
})
-- vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
