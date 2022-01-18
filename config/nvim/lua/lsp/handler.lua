-- LSP handler

local autocmd = require('utils').autocmd
local lsp = vim.lsp
local dbgi = require('utils.logger').dbgi
local debug = false

-- Set default sign
local setup = function(bufnr, resolved_capabilities)
  if vim.tbl_isempty(vim.fn.sign_getdefined('CodeActionSign')) then
    vim.fn.sign_define('CodeActionSign', { text = "💡", texthl = "LspDiagnosticsDefaultInformation" })
  end

  if resolved_capabilities.document_highlight then
    autocmd('lsp_high', [[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]], true)
    autocmd('lsp_cref', [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]], true)
  end

  if resolved_capabilities.code_action then
    return
    autocmd('lsp_coda', [[CursorHold,CursorHoldI <buffer> lua require('lsp.handler').code_action_listener()]], true)
  end

  autocmd('lsp_diag', [[CursorHold <buffer> lua vim.diagnostic.open_float({focusable=false, close_events={'InsertEnter', 'CursorMoved'}})]], true)
  -- autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()
  -- autocmd('lsp', [[BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]], true)
  -- autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
end

local check_capabilities = function (feature)
  local clients = vim.lsp.buf_get_clients(0)
  local supported = false

  for _, client in pairs(clients) do
    supported = client.resolved_capabilities[feature] and true
  end

  return supported
end

local code_action_listener = function()
  local context = { diagnostics = lsp.diagnostic.get_line_diagnostics() }
  local params = lsp.util.make_range_params()

  params.context = context
  lsp.buf_request(0, 'textDocument/codeAction', params, function (err, _, result)
    if debug then dbgi(result) end
    -- autocmd('lsp_coda', [[CursorHold,CursorHoldI <buffer> lua require('lsp.handler').code_action()]], true)
  end)
end

return {
  setup = setup,
  code_action_listener = code_action_listener,
  check_capabilities = check_capabilities,
}
