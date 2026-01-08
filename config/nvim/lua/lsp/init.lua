-- Neovim LSP configs

local autocmd = require('utils').autocmd

local _DEBOUNCE_TIME = 150
local dbgi = require('utils.logger').dbgi

vim.lsp.log.set_level('error') -- Set log level

require('lsp.kind').setup({ text = false, icon = true })
require('lsp.diagnostic').setup()

-- new on LspAttach
autocmd('lsp_attach', { 'LspAttach', nil, function(args)
  local handler = require('lsp.handler')
  local mapping = require('lsp.mappings')

  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
  local bufnr = args.buf

  if client.name ~= 'null-ls' then
    handler.setup(bufnr, client.server_capabilities)
    mapping.setup(bufnr, client.server_capabilities)
  end

  -- if client:supports_method('textDocument/implementation') then
  --   Create a keymap for vim.lsp.buf.implementation ...
  --   dbgi(client.name, client.id)
  -- end

  if _G._DEBUG then
    -- dbgi(vim.lsp.get_active_clients())
    -- dbgi(client:supports_method('textDocument/codeAction'))
    -- dbgi(client.server_capabilities.code_action)
    if client.name == 'emmylua_ls' then
      dbgi(client.server_capabilities)
    end
  end

end
})

-- Custom server ls_emmet.. using new vim.lsp.config
vim.lsp.config('ls_emmet', {
  cmd = { 'ls_emmet', '--stdio' },
  filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact',
    'typescript', 'typescriptreact', 'sass', 'stylus', 'vue' },
  root_dir = function(--[[ fname ]]) return vim.loop.cwd() end,
  settings = {},
})

-- Options for LSP if we need customization
-- vim.lsp.config('emmylua_ls', {
--   cmd = { 'emmylua_ls' },
--   filetypes = { 'lua' },
--   root_markers = { ".luarc.json", ".emmyrc.json", ".luacheckrc", ".git" },
--   workspace_required = false,
--   capabilities = capabilities,
--   on_attach = on_attach,
--   flags = { debounce_text_changes = _DEBOUNCE_TIME },
--   settings = {},
-- })

-- vim.cmd [[autocmd FileType lua lua require('cmp').setup.buffer { sources = { { name = 'nvim_lua' }, { name = 'buffer' } } }]]
-- References = {
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/lua/tj/lsp/
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/
-- }
