-- Diagnostic setup

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' } -- Alternative signs
-- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

local setup = function()

  -- global config for diagnostic
  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    severity_sort = true,
    update_in_insert = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = signs.Error,
        [vim.diagnostic.severity.WARN] = signs.Warn,
        [vim.diagnostic.severity.HINT] = signs.Hint,
        [vim.diagnostic.severity.INFO] = signs.Info,
      },
      linehl = {
        [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      },
      numhl = {
        [vim.diagnostic.severity.WARN] = 'WarningMsg',
      },
    },
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
