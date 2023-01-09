-- neogit configs

local config = function()
  require('neogit').setup({
    auto_refresh = true,
    integrations = { diffview = true },
    commit_popup = { kind = "split" },
    kind = "vsplit",
    signs = {
      -- { closed, open }
      section = { "▶", "▼" },
      item = { "", "" },
      hunk = { "›", "ˬ" },
    },
    disable_signs = false,
    disable_hint = true,
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    disable_insert_on_commit = false,
    sections = {
      untracked = { folded = true },
      unstaged  = { folded = false },
      staged    = { folded = false },
      stashes   = { folded = true },
      unpulled  = { folded = true },
      unmerged  = { folded = true },
      recent    = { folded = true },
    },
  })
end

return {
  'TimUntersberger/neogit',
  config = config,
  cmd = 'Neogit',
}
