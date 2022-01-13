-- LSP mappings
local mappings_table = {
  code_action = {'n', '<Leader>ca', '<cmd>Telescope lsp_code_actions<CR>'}, -- 1
  declaration = {'n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
  document_formatting = {'n', '<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>'},
  document_range_formatting = {'x', '<Leader>bf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>'},
  document_symbol = {'n', '<Leader>ds', '<cmd>Telescope lsp_document_symbols<CR>'}, -- 2
  find_references = {'n', 'gr', '<cmd>Telescope lsp_references<CR>'}, -- 3
  goto_definition = {'n', '<c-]>', '<cmd>Telescope lsp_definitions<CR>'}, -- 4
  hover = {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'}, -- 5
  implementation = {'n', 'gi', '<cmd>Telescope lsp_implementations<CR>'},
  rename = {'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'}, --6
  signature_help = {
    {'n', 'g<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'}, -- 7
    {'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
  },
  type_definition = {'n', '<Leader>D', '<cmd>Telescope lsp_type_definitions<CR>'}, -- 8
  workspace_symbol = {'n', '<Leader>bd', '<cmd>Telescope diagnostics<CR>'}, -- 9
}

local setup = function(bufnr, resolved_capabilities)
  local nmap = require('utils').nmap
  local imap = require('utils').imap
  local dbgi = require('utils.logger').dbgi
  local opts = { buffer = bufnr }

  if vim.fn.has('nvim-0.7') == 1 then
    for cap, key in pairs(resolved_capabilities) do
      local avaiable_mappings = mappings_table[cap]
      if avaiable_mappings and key ~= false then
        dbgi('Capability: '..cap..', Key: ',key and 'true' or 'false', I(mappings_table[cap]))
      end
    end
  -- else
    nmap('gd',         '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    nmap('<c-]>',      '<cmd>Telescope lsp_definitions<CR>', opts)
    nmap('K',          '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    nmap('gi',         '<cmd>Telescope lsp_implementations<CR>', opts)
    nmap('g<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    imap('<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    nmap('<Leader>D',  '<cmd>Telescope lsp_type_definitions<CR>', opts)
    nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    nmap('<Leader>ca', '<cmd>Telescope lsp_code_actions<CR>', opts)
    nmap('gr',         '<cmd>Telescope lsp_references<CR>', opts)
    nmap('<Leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    nmap('<Leader>bd', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
    nmap('<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  nmap('gf',         '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  nmap('[d',         '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nmap(']d',         '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  nmap('<Leader>q',  '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  nmap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nmap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nmap('<Leader>wl', '<cmd>lua I(vim.lsp.buf.list_workspace_folders())<CR>', opts)
end

return {
  setup = setup
}
