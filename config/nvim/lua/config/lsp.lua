-- Neovim LSP configs
-- References = {
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/lua/tj/lsp/
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/
-- }

require('lsp-colors').setup()

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- global config for diagnostic
if vim.fn.has('nvim-0.6') == 1 then
  vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    severity_sort = true,
    update_in_insert = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local nmap = require('utils').nmap
local imap = require('utils').imap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
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
  imap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  nmap('<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nmap('<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nmap('<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  nmap('<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nmap('<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  nmap('<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- nmap('<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  nmap('<Leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  nmap('<Leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- FIXME: Disable for LSP server without CursorHold support
  vim.cmd [[
    autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  ]]
    -- autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    -- autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()

end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Custom server ls_emmet
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
    };
  }
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'sumneko_lua', 'tsserver', 'intelephense', 'html', 'jsonls', 'cssls', 'eslint', 'ls_emmet', 'volar', 'vimls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 50,
    },
    capabilities = capabilities
  }
end

-- Lua CLEANUP: Remove excessive codes since we already have main loop for all LSP server
-- local sumneko_binary_path = vim.fn.exepath("lua-language-server")
-- local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")
--
local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
--
require('lspconfig').sumneko_lua.setup {
  -- capabilities = capabilities,
  on_attach = on_attach,
  -- cmd = { sumneko_binary_path, "-E", sumneko_root_path ..'/main.lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
