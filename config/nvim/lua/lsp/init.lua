-- Neovim LSP configs

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  print('LSP: Error requiring lspconfig')
  return
end

local configs = require('lspconfig.configs')
local nmap = require('utils').nmap
local imap = require('utils').imap
local autocmd = require('utils').autocmd

-- require('lsp-colors').setup()
require('lsp.kind').setup({text = false, icon = true})
require('lsp.diagnostic')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap('gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  nmap('<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  nmap('<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  nmap('<Leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  imap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  nmap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nmap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nmap('<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  nmap('<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nmap('<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  nmap('<Leader>D', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  nmap('<Leader>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  nmap('<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- FIXME: Disable for LSP server without CursorHold support
  autocmd('lsp', [[CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]], true)
  autocmd('lsp', [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]], true)
  autocmd('lsp', [[CursorHold,CursorHoldI <buffer> lua vim.diagnostic.open_float()]], true)
  -- autocmd('lsp', [[BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]], true)
  -- autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
end

-- Custom server ls_emmet.. must be above the main servers loop
if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
      root_dir = function(--[[ fname ]])
        return vim.loop.cwd()
      end;
      settings = {};
    }
  }
end

-- Setup lspconfig with snippet support
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local DEBOUNCE_TIME = 150
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'cssls', 'eslint', 'html', 'intelephense', 'jsonls', 'ls_emmet', 'tsserver', 'vimls', 'volar' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = DEBOUNCE_TIME,
    },
    capabilities = capabilities
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = { debounce_text_changes = DEBOUNCE_TIME, },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- Tell the language server we're using LuaJIT
        path = runtime_path, -- Setup your lua path
      },
      diagnostics = {
        globals = {'vim'}, -- Get the language server to recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
      },
      telemetry = { enable = false, },
    },
  },
}

-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
-- References = {
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/lua/tj/lsp/
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/
-- }
