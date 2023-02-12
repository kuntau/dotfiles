-- LSP, linter & formatter configs

local ensure_installed = {
  'lua_ls',
  'tsserver',
  'intelephense',
  'volar',
}

-- This is here to format on save
-- you can reuse a shared lspconfig on_attach callback here
local enable_format_on_save = false
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local format_on_save = function(client, bufnr)
  if client.supports_method('textDocument/formatting') and enable_format_on_save then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

-- Source references:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/doc/BUILTINS.md
-- https://github.com/jose-elias-alvarez/null-ls.nvim/doc/BUILTIN_CONFIG.md

local config_null = function()
  local nls = require('null-ls')

  nls.setup({
    debounce = 150,
    save_after_format = false,
    on_attach = format_on_save,
    sources = {
      -- Formatter
      -- nls.builtins.formatting.deno_fmt, -- deno
      nls.builtins.formatting.stylua, -- lua
      nls.builtins.formatting.prettierd.with({
        filetypes = { 'js', 'jsx', 'ts', 'tsx', 'vue', 'markdown' }
      }), -- JS/TS
      nls.builtins.formatting.pint, -- PHP
      -- nls.builtins.formatting.rome, -- JS/TS
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      -- nls.builtins.formatting.shfmt, -- Shell/POSIX
      nls.builtins.formatting.beautysh, -- Prefer this over shfmt bcoz it support `zsh`
      nls.builtins.formatting.black, -- Python
      -- nls.builtins.formatting.prettierd.with({
      --   filetypes = { "markdown" }, -- only runs `prettierd` for markdown
      -- }),

      -- Linter
      nls.builtins.diagnostics.eslint_d, -- JS/TS
      nls.builtins.diagnostics.phpstan, -- PHP
      nls.builtins.diagnostics.shellcheck, -- Bash
      -- nls.builtins.diagnostics.pylint, -- Python
      -- nls.builtins.diagnostics.mypy, -- Python
      -- nls.builtins.diagnostics.selene.with({
      --   condition = function(utils)
      --     return utils.root_has_file({ "selene.toml" })
      --   end,
      -- }),

      -- Code actions
      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.code_actions.eslint_d,
      nls.builtins.code_actions.refactoring,
      nls.builtins.code_actions.shellcheck, -- Bash

      -- Hover
      -- nls.builtins.hover.dictionary
    },
  })
end

local function config_aerial()
  require('aerial').setup({
    on_attach = function(bufnr)
      local nmap = require('utils').nmap
      nmap('}', '<cmd>AerialNext<cr>', { buffer = bufnr, desc = 'Aerial Next' })
      nmap('{', '<cmd>AerialPrev<cr>', { buffer = bufnr, desc = 'Aerial Prev' })
    end,
  })
end

return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    config = function() require('lsp') end,
    dependencies = {
      {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        config = true,
        dependencies = {
          'williamboman/mason-lspconfig.nvim',
          opts = {
            automatic_installation = true,
            ensure_installed = ensure_installed,
          },
        }, -- Bridge for mason-LSP config
      }, -- Auto/manage LSP
      { 'stevearc/aerial.nvim', cmd = 'AerialToggle', config = config_aerial },
      { 'jose-elias-alvarez/null-ls.nvim', config = config_null }, -- Bridge LSP
    },
  },
}
