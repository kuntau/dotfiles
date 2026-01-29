-- markdown configs

-- markdown-plus keymaps - https://github.com/yousefhadder/markdown-plus.nvim/wiki/5.Keymaps

obsidian = {
  legacy_commands = false, -- this will be removed in the next major release
  frontmatter = {
    enabled = false,
  },
  log_level = vim.log.levels.ERROR,
  daily_notes = {
    folder = 'Diary',
  },
  workspaces = {
    {
      name = 'Notes',
      path = "~/notes",
    },
  },
}

return {
  { 'yousefhadder/markdown-plus.nvim', config = true, ft = 'markdown' },
  { 'toppair/peek.nvim', config = true, build = 'deno task --quiet build:fast', ft = 'markdown' }, -- Markdown preview
  { 'obsidian-nvim/obsidian.nvim', enabled = true, version = '*', opts = obsidian, ft = 'markdown' },
  { 'OXY2DEV/markview.nvim', ft = 'markdown' }, -- TODO: Torned between this or `markdown.nvim`
  -- { 'MeanderingProgrammer/render-markdown.nvim', config = true, ft = 'markdown' },
}
