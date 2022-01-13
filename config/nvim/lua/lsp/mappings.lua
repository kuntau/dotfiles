-- LSP mappings
local capability_table = {
  call_hierarchy = false,
  code_action = {
    codeActionKinds = { "", "quickfix", "refactor.rewrite", "refactor.extract" },
    resolveProvider = false
  },
  code_lens = false,
  code_lens_resolve = false,
  completion = true,
  declaration = false,
  document_formatting = false,
  document_highlight = true,
  document_range_formatting = false,
  document_symbol = true,
  execute_command = true,
  find_references = true,
  goto_definition = true,
  hover = true,
  implementation = false,
  rename = true,
  signature_help = true,
  text_document_did_change = 2,
  text_document_open_close = true,
  text_document_save = false,
  text_document_save_include_text = false,
  text_document_will_save = false,
  text_document_will_save_wait_until = false,
  type_definition = true,
  workspace_folder_properties = {
    changeNotifications = false,
    supported = false
  },
  workspace_symbol = true
}

local setup = function(bufnr, resolved_capabilities)
  local nmap = require('utils').nmap
  local imap = require('utils').imap
  local opts = { buffer = bufnr }

  nmap('gd',         '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  nmap('<c-]>',      '<cmd>Telescope lsp_definitions<CR>', opts)
  nmap('K',          '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  nmap('gi',         '<cmd>Telescope lsp_implementations<CR>', opts)
  nmap('g<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  imap('<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  nmap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nmap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nmap('<Leader>wl', '<cmd>lua I(vim.lsp.buf.list_workspace_folders())<CR>', opts)
  nmap('<Leader>D',  '<cmd>Telescope lsp_type_definitions<CR>', opts)
  nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nmap('<Leader>ca', '<cmd>Telescope lsp_code_actions<CR>', opts)
  nmap('gr',         '<cmd>Telescope lsp_references<CR>', opts)
  nmap('[d',         '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nmap(']d',         '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  nmap('<Leader>q',  '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  nmap('<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  nmap('<Leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', opts)
  nmap('<Leader>bd', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
  nmap('gf',         '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

return {
  setup = setup
}
