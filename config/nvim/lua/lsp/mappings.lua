-- LSP mappings
-- These are over-engineered-complicated POC that are PITA to maintain

-- NOTE: These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- "gri" is mapped to vim.lsp.buf.implementation()
-- "grn" is mapped to vim.lsp.buf.rename()
-- "grr" is mapped to vim.lsp.buf.references()
-- "grt" is mapped to vim.lsp.buf.type_definition()
-- "gO" is mapped to vim.lsp.buf.document_symbol()
-- CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
-- "an" and "in" (Visual and Operator-pending mode) are mapped to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()
-- BUFFER-LOCAL DEFAULTS
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
-- Document colors are enabled for highlighting color references in a document.
-- To opt out call vim.lsp.document_color.enable(false, args.buf) on LspAttach.

-- stylua: ignore
local mappings_table = {
  codeActionProvider              =  { 'map',  '<Leader>la', function() vim.lsp.buf.code_action() end, 'Code action' },
  declarationProvider             =  { 'nmap', '<Leader>ld', function() vim.lsp.buf.declaration() end, 'Goto declaration'  },
  documentFormattingProvider      =  { 'nmap', '<Leader>lf', function() vim.lsp.buf.format() end, 'LSP format buffer' },
  renameProvider                  =  { 'nmap', '<Leader>lr', function() vim.lsp.buf.rename() end, 'LSP rename' },
  documentRangeFormattingProvider =  { 'map',  'grf',        function() vim.lsp.buf.format() end, 'LSP format range' },
  hoverProvider                   =  { 'nmap', 'K',          function() if not require('ufo').peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end end, 'Hover' },
  signatureHelpProvider           =  {
                                     { 'nmap', '<Leader>ls', function() vim.lsp.buf.signature_help() end, 'LSP signature' },
                                     { 'imap', '<C-k>',      function() vim.lsp.buf.signature_help() end, 'LSP signature' },
  },
  definitionProvider              =  { 'nmap', '<c-]>',      function() Snacks.picker.lsp_definitions() end, 'LSP definitions (Snacks)' },
  documentSymbolProvider          =  { 'nmap', '<Leader>lS', function() Snacks.picker.lsp_symbols() end, 'LSP document symbols (Snacks)' },
  implementationProvider          =  { 'nmap', '<Leader>li', function() Snacks.picker.lsp_implementations() end, 'LSP implementation (Snacks)' },
  referencesProvider              =  { 'nmap', '<Leader>le', function() Snacks.picker.lsp_references() end, 'LSP references (Snacks)' },
  typeDefinitionProvider          =  { 'nmap', '<Leader>lt', function() Snacks.picker.lsp_type_definitions() end, 'LSP type definitions (Snacks)' },
  workspaceSymbolProvider         =  { 'nmap', '<Leader>lD', function() Snacks.picker.lsp_workspace_symbols() end, 'LSP Workspace Symbol (Snacks)' },
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
        if _G._DEBUG then dbgi('Keymap table: ', vim.inspect(keymap)) end
        local mode, lhs, rhs, desc = unpack(keymap)
        map[mode](lhs, rhs, desc, opts)
      end
    else
      vim.notify('Unknown Keymap: ' .. keymaps, vim.log.levels.ERROR)
    end
  end

  -- stylua: ignore
  nmap(']d', function() vim.diagnostic.jump({ count = 1 }) end,  'Next diagnostic')
  nmap('[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Prev diagnostic')
  nmap('<Leader>ll',  function() vim.diagnostic.open_float() end, 'Open diagnostics float')
  nmap('<Leader>sq',  function() vim.diagnostic.setqflist() end, 'Open diagnostics in QuickFix list')
  nmap('<Leader>sl',  function() vim.diagnostic.setloclist() end, 'Open diagnostics in Location List')
  nmap('<Leader>lwa', function() vim.lsp.buf.add_workspace_folder() end, 'Add folder')
  nmap('<Leader>lwr', function() vim.lsp.buf.remove_workspace_folder() end, 'Remove folder')
  nmap('<Leader>lwl', function() vim.lsp.buf.list_workspace_folders() end, 'List folder')
  nmap('<Leader>l!',  function() vim.notify(vim.inspect(vim.lsp.get_clients()[1].server_capabilities)) end, 'Show LSP capabilities', opts)
end

return {
  setup = setup,
}
