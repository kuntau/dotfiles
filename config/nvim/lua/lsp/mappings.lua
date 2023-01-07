-- LSP mappings
local mappings_table = {
  codeActionProvider = { 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>' }, -- 1
  declarationProvider = { 'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
  documentFormattingProvider = { 'n', '<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>' },
  documentSymbolProvider = { 'n', '<Leader>ds', '<cmd>Telescope lsp_document_symbols<CR>' }, -- 2
  documentRangeFormattingProvider = { 'x', '<Leader>bf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>' },
  referencesProvider = { 'n', 'gr', '<cmd>Telescope lsp_references<CR>' }, -- 3
  definitionProvider = { 'n', '<c-]>', '<cmd>Telescope lsp_definitions<CR>' }, -- 4
  hoverProvider = { 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' }, -- 5
  implementationProvider = { 'n', 'gi', '<cmd>Telescope lsp_implementations<CR>' },
  renameProvider = { 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>' }, --6
  signatureHelpProvider = {
    { 'n', 'g<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>' }, -- 7
    { 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>' },
  },
  typeDefinitionProvider = { 'n', '<Leader>D', '<cmd>Telescope lsp_type_definitions<CR>' }, -- 8
  workspaceSymbolProvider = { 'n', '<Leader>bd', '<cmd>Telescope diagnostics<CR>' }, -- 9
}

local setup = function(bufnr, server_capabilities)
  local nmap = require('utils').nmap
  local imap = require('utils').imap
  local dbgi = require('utils.logger').dbgi
  local opts = { buffer = bufnr }

  for cap, key in pairs(server_capabilities) do
    local keymap = mappings_table[cap]
    if keymap and key ~= false then
      -- dbgi('Capability: '..cap..', Key: ',key and 'true' or 'false', I(mappings_table[cap]))
      if type(keymap[1]) == 'string' then
        -- dbgi('Keymap string: ', keymap)
        vim.keymap.set(keymap[1], keymap[2], keymap[3], opts)
      elseif type(keymap[1]) == 'table' then
        for _, map in ipairs(keymap) do
          -- dbgi('Keymap table: ', map)
          vim.keymap.set(map[1], map[2], map[3], opts)
        end
      else
        vim.notify('Unknown Keymap: ' .. keymap, vim.log.levels.ERROR)
      end
    end
  end

  nmap('gf', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  nmap('<Leader>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  nmap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nmap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nmap('<Leader>wl', '<cmd>lua I(vim.lsp.buf.list_workspace_folders())<CR>', opts)
end

return {
  setup = setup,
}
