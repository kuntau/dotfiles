-- neogit configs

local config = function()
  require('neogit').setup({
    auto_refresh = true,
    -- remember_settings = true,
    integrations = { diffview = true },
    commit_popup = { kind = "split" },
    kind = "vsplit",
    signs = {
      -- { closed, open }
      section = { "▶", "▼" },
      item = { "", "" },
      hunk = { "›", "ˬ" },
    },
    graph_style = 'unicode',
    disable_signs = false,
    disable_hint = true,
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    -- disable_insert_on_commit = 'auto',
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
  branch = 'nightly',
  cmd = 'Neogit',
  dev = false,
}
