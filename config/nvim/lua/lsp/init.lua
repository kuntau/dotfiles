-- Neovim LSP configs

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
  print('LSP: Error requiring lspconfig')
  return
end

local configs = require('lspconfig.configs')
local servers = {
  'bashls',
  'intelephense',
  'ls_emmet',
  'tsserver',
  'vimls',
  'volar',
  'pylsp',
  'clangd',
  -- 'cssls',
  -- 'eslint',
  -- 'html',
  -- 'jsonls',
  -- 'denols',
}
local DEBOUNCE_TIME = 150
local dbgi = require('utils.logger').dbgi
local debug = false

require('lsp.kind').setup({ text = false, icon = true })
require('lsp.diagnostic').setup()

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local handler = require('lsp.handler')
  local mapping = require('lsp.mappings')

  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>

  handler.setup(bufnr, client.server_capabilities)
  mapping.setup(bufnr, client.server_capabilities)

  if debug then
    dbgi(vim.lsp.get_active_clients())
    dbgi(client.supports_method('textDocument/codeAction'))
    --[[ dbgi(client.server_capabilities.code_action) ]]
  end

  -- handler.code_action(client)
end

-- Custom server ls_emmet.. must be above the main servers loop
if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' },
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact',
        'typescript', 'typescriptreact', 'sass', 'stylus', 'vue' },
      root_dir = function(--[[ fname ]]) return vim.loop.cwd() end,
      settings = {},
    },
  }
end

-- Setup lspconfig with snippet support
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local neodev_ok, neodev = pcall(require, 'neodev')
if neodev_ok then neodev.setup({ library = { runtime = true, plugins = false } }) end

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = { debounce_text_changes = DEBOUNCE_TIME },
  settings = {
    Lua = {
      completion = {
        workspaceWord = true,
        callSnippet = 'Replace', -- 'Both'
      },
      runtime = {
        version = 'LuaJIT', -- Tell the language server we're using LuaJIT
        -- path = runtime_path, -- Setup your lua path. SLOW: Use neodev
      },
      diagnostics = {
        globals = { 'vim' }, -- Get the language server to recognize the `vim` global
      },
      workspace = {
        -- library = vim.api.nvim_get_runtime_file('', true), -- Make the server aware of Neovim runtime files. SLOW: Use neodev
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = DEBOUNCE_TIME,
    },
    capabilities = capabilities,
  })
end

-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
-- References = {
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/lua/tj/lsp/
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/
-- }
