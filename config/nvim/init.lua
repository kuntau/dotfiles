-- init.lua --

if vim.loader then
  vim.loader.enable()
end

require('config.options')
require('config.lazy')
require('config.ui')

_G._DEBUG = false

local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "VeryLazy",
  callback = function()
    require('config.events')
    require('config.mappings')
    require('config.commands')

    -- Create some toggle mappings
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>os")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>oL")
    Snacks.toggle.option("cursorcolumn", { name = "Cursor Column" }):map("<leader>or")
    Snacks.toggle.diagnostics():map("<leader>od")
    Snacks.toggle.line_number():map("<leader>ol")
    Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>oc")
    Snacks.toggle.treesitter():map("<leader>oT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ob")
    Snacks.toggle.inlay_hints():map("<leader>oh")
    Snacks.toggle.indent():map("<leader>og")
    Snacks.toggle.dim():map("<leader>oD")
  end
})
