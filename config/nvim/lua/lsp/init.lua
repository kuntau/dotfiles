-- Neovim LSP configs

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  print('LSP: Error requiring lspconfig')
  return
end

local configs = require('lspconfig.configs')

require('lsp.kind').setup({text = false, icon = true})
require('lsp.diagnostic').setup()
local debug = false
local dbgi = require('utils.logger').dbgi

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local nmap = require('utils').nmap
  local imap = require('utils').imap
  local handler = require('lsp.handler')

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>

  handler.setup()
  if debug then dbgi(vim.lsp.get_active_clients()) end
  -- if debug then dbgi(client) end
  -- PP(vim.lsp.protocol.make_client_capabilities())

  -- See `:help vim.lsp.*` for documentation on any of the below functions
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
  --nmap('<Leader>D','<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  handler.document_highlight(client)
  handler.code_action(client)
  -- handler.check_capabilities(client, 'textDocument/declaration')

  -- FIXME: Disable for LSP server without CursorHold support
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local DEBOUNCE_TIME = 150
-- Use a loop to conveniently call 'setup' on multiple servers and map buffer local keybindings when the language server attaches
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

local luadev_ok, luadev = pcall(require, 'lua-dev')
if luadev_ok then luadev.setup() end

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
