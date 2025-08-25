-- snacks.nvim configs

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    image = { enabled = false },
    -- indent = { enabled = false }, -- enabled in event
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>ef", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>e/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>ee", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>et", function() Snacks.terminal() end, desc = "Floating terminal" },
    { "<leader>es", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>e:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>en", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>eu", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>ep", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>eq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>eg", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>ec", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>eC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>eG", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>eB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>ez", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>eZ", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },


    {
      "<leader>eN",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  }
}
