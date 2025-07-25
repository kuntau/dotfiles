-- lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
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
    enabled = true,
    frequency = 7200, -- 2 hours
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
  rocks = { enabled = false },
  debug = false,
  dev = {
    path = "~/coding/forks"
  }
})
