-- LSP, linter & formatter configs

local ensure_installed = {
  'lua_ls',
  'ts_ls',
  'intelephense',
  'vue_ls',
}

-- This is here to format on save
-- you can reuse a shared lspconfig on_attach callback here
local enable_format_on_save = false
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local format_on_save = function(client, bufnr)
  if client:supports_method('textDocument/formatting') and enable_format_on_save then
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
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
-- https://github.com/nvimtools/none-ls-extras.nvim

local config_null = function()
  local nuls = require('null-ls')

  nuls.setup({
    debounce = 150,
    save_after_format = false,
    on_attach = format_on_save,
    sources = {
      -- Formatter
      -- nuls.builtins.formatting.deno_fmt, -- deno
      nuls.builtins.formatting.stylua, -- lua
      nuls.builtins.formatting.prettierd.with({
        filetypes = { 'js', 'jsx', 'ts', 'tsx', 'vue', 'markdown' }
      }), -- JS/TS
      nuls.builtins.formatting.pint, -- PHP
      -- nuls.builtins.formatting.rome, -- JS/TS
      -- nuls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nuls.builtins.formatting.eslint_d,
      -- nuls.builtins.formatting.shfmt, -- Shell/POSIX/Bash
      require('none-ls.formatting.beautysh'), -- Prefer this over shfmt bcoz it support `zsh`
      -- require('none-ls.formatting.beautysh').with({ filetypes = { "zsh" }}), -- Prefer this over shfmt bcoz it support `zsh`
      nuls.builtins.formatting.black, -- Python
      -- nuls.builtins.formatting.prettierd.with({
      --   filetypes = { "markdown" }, -- only runs `prettierd` for markdown
      -- }),

      -- Linter
      -- nuls.builtins.diagnostics.eslint, -- JS/TS NOTE: Use LSP
      nuls.builtins.diagnostics.phpstan, -- PHP
      -- nuls.builtins.diagnostics.bashls, -- Bash/sh NOTE: Use LSP
      nuls.builtins.diagnostics.zsh, -- zsh
      -- nuls.builtins.diagnostics.pylint, -- Python
      -- nuls.builtins.diagnostics.mypy, -- Python
      -- nuls.builtins.diagnostics.selene.with({
      --   condition = function(utils)
      --     return utils.root_has_file({ "selene.toml" })
      --   end,
      -- }),

      -- Code actions
      -- nuls.builtins.code_actions.gitsigns,
      -- nuls.builtins.code_actions.eslint, -- NOTE: Use LSP
      nuls.builtins.code_actions.refactoring,
      -- nuls.builtins.code_actions.basls, -- Bash NOTE: Use LSP

      -- Hover
      -- nuls.builtins.hover.dictionary
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
        -- dependencies = ,
      }, -- Auto/manage LSP
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          automatic_installation = true,
          ensure_installed = ensure_installed,
        },
      },  -- Bridge for mason-LSP config
      { 'stevearc/aerial.nvim', cmd = 'AerialToggle', config = config_aerial },
      { 'nvimtools/none-ls.nvim', dependencies = { "nvimtools/none-ls-extras.nvim" }, config = config_null }, -- Bridge LSP
    },
  },
}
