-- LSP mappings

-- stylua: ignore
local mappings_table = {
  codeActionProvider              =  { 'map',  '<Leader>la', function() vim.lsp.buf.code_action() end, 'Code action' },
  declarationProvider             =  { 'nmap', '<Leader>ld', function() vim.lsp.buf.declaration() end, 'Goto declaration'  },
  documentFormattingProvider      =  { 'nmap', '<Leader>lf', function() vim.lsp.buf.format() end, 'LSP format buffer' },
  renameProvider                  =  { 'nmap', '<Leader>lr', function() vim.lsp.buf.rename() end, 'LSP rename' },
  documentRangeFormattingProvider =  { 'map',  '<F4>',       function() vim.lsp.buf.format() end, 'LSP format range' },
  hoverProvider                   =  { 'nmap', 'K',          function() if not require('ufo').peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end end, 'Hover' },
  signatureHelpProvider           =  {
                                     { 'nmap', '<Leader>ls', function() vim.lsp.buf.signature_help() end, 'LSP signature' },
                                     { 'imap', '<C-k>',      function() vim.lsp.buf.signature_help() end, 'LSP signature' },
  },
  definitionProvider              =  { 'nmap', '<c-]>',      '<cmd>Telescope lsp_definitions<CR>', 'LSP definitions (Telescope)' },
  documentSymbolProvider          =  { 'nmap', '<Leader>lS', '<cmd>Telescope lsp_document_symbols<CR>', 'LSP document symbols (Telescope)' },
  implementationProvider          =  { 'nmap', '<Leader>li', '<cmd>Telescope lsp_implementations<CR>', 'LSP implementation (Telescope)' },
  referencesProvider              =  { 'nmap', '<Leader>le', '<cmd>Telescope lsp_references<CR>', 'LSP references (Telescope)' },
  typeDefinitionProvider          =  { 'nmap', '<Leader>lt', '<cmd>Telescope lsp_type_definitions<CR>', 'LSP type definitions (Telescope)' },
  workspaceSymbolProvider         =  { 'nmap', '<Leader>lD', '<cmd>Telescope diagnostics<CR>', 'LSP diagnostics (Telescope)' },
}

-- These three words
local setup = function(bufnr, server_capabilities)
  local is_tbl_only = require('utils').is_tbl_only
  local dbgi = require('utils.logger').dbgi
  local map = require('utils.mapper')
  local nmap = map['nmap']
  local opts = { buffer = bufnr }
  local debug = false

  for capability, _ in pairs(server_capabilities) do
    local keymaps = mappings_table[capability]
    if keymaps ~= false then
      keymaps = is_tbl_only(keymaps) and keymaps or { keymaps }
      for _, keymap in ipairs(keymaps) do
        if debug then dbgi('Keymap table: ', vim.inspect(keymap)) end
        local mode, lhs, rhs, desc = unpack(keymap)
        map[mode](lhs, rhs, desc, opts)
      end
    else
      vim.notify('Unknown Keymap: ' .. keymaps, vim.log.levels.ERROR)
    end
  end

  -- stylua: ignore
  nmap(']d', function() vim.diagnostic.goto_next() end,  'Next diagnostic')
  nmap('[d', function() vim.diagnostic.goto_prev() end, 'Prev diagnostic')
  nmap('<Leader>ll',  function() vim.diagnostic.open_float() end, 'Open diagnostics float')
  nmap('<Leader>sq',  function() vim.diagnostic.setqflist() end, 'Open diagnostics in QuickFix list')
  nmap('<Leader>sl',  function() vim.diagnostic.setloclist() end, 'Open diagnostics in Location List')
  nmap('<Leader>lwa', function() vim.lsp.buf.add_workspace_folder() end, 'Add folder')
  nmap('<Leader>lwr', function() vim.lsp.buf.remove_workspace_folder() end, 'Remove folder')
  nmap('<Leader>lwl', function() vim.lsp.buf.list_workspace_folders() end, 'List folder')
  nmap('<Leader>l!',  function() vim.notify(vim.inspect(vim.lsp.get_active_clients()[1].server_capabilities)) end, 'Show LSP capabilities', opts)
end

return {
  setup = setup,
}
