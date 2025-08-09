-- lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "kanagawa", "habamax" } },
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
  pkg = { enabled = false },
  rocks = { enabled = false },
  debug = false,
  profiling = {
    loader = false,
    require = false,
  },
  -- dev = {
  --   path = "~/coding/forks"
  -- }
})
