-- Diagnostic setup

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

local setup = function()

  -- global config for diagnostic
  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      -- header = "",
      -- prefix = "",
    },
  })

  for type, icon in pairs(signs) do
    local hl = string.format('DiagnosticSign%s', type)
    if vim.tbl_isempty(vim.fn.sign_getdefined(hl)) then
      vim.fn.sign_define(hl, { text = icon, texthl = hl})
    end
  end
end

return {
  setup = setup
}
