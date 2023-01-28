-- LSP handler

local autocmd = require('utils').autocmd
local lsp = vim.lsp
local dbgi = require('utils.logger').dbgi
local debug = false

-- Set default sign
local setup = function(bufnr, server_capabilities)
  if vim.tbl_isempty(vim.fn.sign_getdefined('CodeActionSign')) then
    vim.fn.sign_define('CodeActionSign', { text = "💡", texthl = "LspDiagnosticsDefaultInformation" })
  end

  if server_capabilities.documentHighlightProvider then
    autocmd('lsp_highlight', {
      { { 'CursorHold','CursorHoldI' }, bufnr, function() vim.lsp.buf.document_highlight() end },
      { 'CursorMoved', bufnr, function() vim.lsp.buf.clear_references() end }
    })
  end

  if server_capabilities.codeActionProvider then
    return
    -- autocmd('lsp_coda', [[CursorHold,CursorHoldI <buffer> lua require('lsp.handler').code_action_listener(bufnr)]], true)
  end

  -- autocmd('lsp_float', { 'CursorHold', bufnr,
  --   function()
  --     vim.diagnostic.open_float({
  --       focusable = false,
  --       close_events = { 'InsertEnter', 'CursorMoved' },
  --     })
  --   end,
  -- })

  -- autocmd('lsp_diag', [[CursorHold <buffer> lua vim.diagnostic.open_float({focusable=false, close_events={'InsertEnter', 'CursorMoved'}})]], true)
  -- autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()
  -- autocmd('lsp', [[BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]], true)
  -- autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
end

local check_capabilities = function (feature)
  local clients = vim.lsp.buf_get_active_clients(0)
  local supported = false

  for _, client in pairs(clients) do
    supported = client.server_capabilities[feature] and true
  end

  return supported
end

local code_action_listener = function()
  local context = { diagnostics = vim.lsp.diagnostic.get() }
  local params = lsp.util.make_range_params()

  params.context = context
  lsp.buf_request(0, 'textDocument/codeAction', params, function (_, _, result)
    if debug then dbgi(result) end
    -- autocmd('lsp_coda', [[CursorHold,CursorHoldI <buffer> lua require('lsp.handler').code_action()]], true)
  end)
end

return {
  setup = setup,
  code_action_listener = code_action_listener,
  check_capabilities = check_capabilities,
}
