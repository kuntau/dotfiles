-- LSP mappings
local mappings_table = {
  codeActionProvider              = { ['<Leader>la'] = { function() vim.lsp.buf.code_action() end, 'Code action', mode = { 'n', 'v' } } },
  declarationProvider             = { ['<Leader>ld'] = { function() vim.lsp.buf.declaration() end, 'Goto declaration' } },
  documentFormattingProvider      = { ['<Leader>lf'] = { function() vim.lsp.buf.format() end, 'LSP format buffer' } },
  renameProvider                  = { ['<Leader>lr'] = { function() vim.lsp.buf.rename() end, 'LSP rename' } },
  documentRangeFormattingProvider = { ['<F4>'] = { function() vim.lsp.buf.format() end, 'LSP format range', mode='v' } },
  hoverProvider                   = { ['K'] = { function() vim.lsp.buf.hover() end, 'Hover' } },
  signatureHelpProvider           = {
                                    { ['<Leader>lk'] = { function() vim.lsp.buf.signature_help() end, 'LSP signature' } },
                                    { ['<C-k>'] = { function() vim.lsp.buf.signature_help() end, 'LSP signature', mode = 'i' } },
  },
  definitionProvider              = { ['<c-]>'] = { '<cmd>Telescope lsp_definitions<CR>', 'LSP definitions' } },
  documentSymbolProvider          = { ['<Leader>fs'] = { '<cmd>Telescope lsp_document_symbols<CR>', 'LSP document symbols' } },
  implementationProvider          = { ['gi'] = { '<cmd>Telescope lsp_implementations<CR>', 'LSP implementation' } },
  referencesProvider              = { ['gr'] = { '<cmd>Telescope lsp_references<CR>', 'LSP references' } },
  typeDefinitionProvider          = { ['<Leader>fT'] = { '<cmd>Telescope lsp_type_definitions<CR>', 'LSP type definitions' } },
  workspaceSymbolProvider         = { ['<Leader>fD'] = { '<cmd>Telescope diagnostics<CR>', 'LSP diagnostics' } },
}

local setup = function(bufnr, server_capabilities)
  local dbgi  = require('utils.logger').dbgi
  local wk    = require('which-key')
  local debug = false
  local opts  = { buffer = bufnr }

  local maps = {
    [']d'] = { function() vim.diagnostic.goto_next() end, 'Next diagnostic' },
    ['[d'] = { function() vim.diagnostic.goto_prev() end, 'Prev diagnostic' },
    ['<Leader>l'] = { name = 'LSP' },
    ['<Leader>s'] = {
      name = 'Diagnostics',
      q = { function() vim.diagnostic.setqflist() end, 'Open diagnostics in QuickFix list' },
      l = { function() vim.diagnostic.setloclist() end, 'Open diagnostics in Location List' },
    },
    ['<Leader>w'] = {
      name = 'Workspace',
      a = { function() vim.lsp.buf.add_workspace_folder() end, 'Add folder' },
      r = { function() vim.lsp.buf.remove_workspace_folder() end, 'Remove folder' },
      l = { function() vim.lsp.buf.list_workspace_folders() end, 'List folder' },
    },
    gf = { function() vim.diagnostic.open_float() end, 'Open diagnostics float' },
  }

  -- Loop for each server capabilities
  for capability, key in pairs(server_capabilities) do
    -- We're only instered with what we have in mappings_table
    local keymap = mappings_table[capability]
    -- If those exist and have any value other than `false` then we're good to go
    if keymap and key ~= false then
      -- if debug then dbgi('Capability: ' .. capability .. ', Key: ', key and 'true' or 'false', #keymap, vim.inspect(keymap)) end
      if type(keymap) == 'table' then
        maps = vim.tbl_extend('keep', maps, keymap)
        -- if debug then dbgi('Maps: ', maps) end
      else
        vim.notify('Unknown Keymap: ' .. vim.inspect(keymap), vim.log.levels.ERROR)
      end
    end
  end

  if debug then dbgi('Final Maps: ', maps) end
  wk.register(maps, opts)
end

return {
  setup = setup,
}
