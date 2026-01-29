-- neogit configs

config = {
  auto_refresh = true,
  auto_show_console = true,
  remember_settings = true,
  graph_style = 'unicode',
  console_timeout = 5000,
  disable_signs = false,
  disable_hint = true,
  disable_commit_confirmation = true,
  disable_builtin_notifications = true,
  disable_insert_on_commit = 'auto',
  kind = "floating",
  commit_editor = {
    kind = "floating"
  },
  commit_select_view = {
    kind = "floating",
  },
  commit_view = {
    kind = "floating",
  },
  log_view = {
    kind = "floating",
  },
  rebase_editor = {
    kind = "auto",
  },
  reflog_view = {
    kind = "floating",
  },
  merge_editor = {
    kind = "auto",
  },
  preview_buffer = {
    kind = "floating_console",
  },
  popup = {
    kind = "floating",
  },
  stash = {
    kind = "floating",
  },
  refs_view = {
    kind = "floating",
  },
  integrations = {
    diffview = true,
    snacks = true,
  },
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
  }

return {
  'NeogitOrg/neogit',
  opts = config,
  cmd = 'Neogit',
}
