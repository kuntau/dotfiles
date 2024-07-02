-- neogit configs

local config = function()
  require('neogit').setup({
    auto_refresh = true,
    auto_show_console = true,
    remember_settings = true,
    kind = "vsplit",
    graph_style = 'unicode',
    console_timeout = 5000,
    disable_signs = false,
    disable_hint = true,
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    -- disable_insert_on_commit = 'auto',
    integrations = { diffview = true },
    signs = {
      -- { closed, open }
      section = { "▶", "▼" },
      item = { "", "" },
      hunk = { "›", "ˬ" },
    },
    sections = {
      untracked = { hidden = false, folded = true },
      unstaged  = { hidden = false, folded = false },
      staged    = { hidden = false, folded = false },
      stashes   = { hidden = false, folded = true },
      unpulled  = { hidden = false, folded = true },
      unmerged  = { hidden = false, folded = true },
      recent    = { hidden = false, folded = true },
    },
  })
end

return {
  'NeogitOrg/neogit',
  config = config,
  cmd = 'Neogit',
}
