-- neogit configs

require('neogit').setup({
  integrations = {
    diffview = true
  },
  commit_popup = {
    kind = "split"
  },
  kind = "vsplit",
  signs = {
    -- { closed, open }
    section = { "❱", "▼" },
    item = { "", "" },
    hunk = { "›", "ˬ" },
  },
  disable_signs = false,
  disable_hint = true,
  disable_commit_confirmation = true,
  disable_builtin_notifications = false,
  disable_insert_on_commit = false,
})
