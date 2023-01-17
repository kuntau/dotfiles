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

-- load lazy
require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "habamax" } },
  checker = {
    concurrency = 5,
    enabled = false,
    frequency = 7200,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
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
  diff = { cmd = 'diffview.nvim' },
  ui = { border = 'rounded' },
  debug = false,
  dev = {
    path = "~/coding/forks"
  }
})
