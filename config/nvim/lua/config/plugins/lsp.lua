-- LSP, linter & formatter configs

local ensure_installed = {
  'sumneko_lua',
  'tsserver',
  'intelephense',
  'volar',
}

local config_null = function()
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {
      -- nls.builtins.formatting.deno_fmt,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.pint,
      -- nls.builtins.formatting.rome,
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      -- nls.builtins.formatting.shfmt,
      -- nls.builtins.formatting.prettierd.with({
      --   filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
      -- }),

      nls.builtins.diagnostics.eslint_d,
      nls.builtins.diagnostics.phpstan,
      -- nls.builtins.diagnostics.selene.with({
      --   condition = function(utils)
      --     return utils.root_has_file({ "selene.toml" })
      --   end,
      -- }),

      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.code_actions.eslint_d,
      nls.builtins.code_actions.refactoring,
    },

    -- This is here to format on save
    -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    --   if client.supports_method("textDocument/formatting") then
    --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       group = augroup,
    --       buffer = bufnr,
    --       callback = function()
    --         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --         vim.lsp.buf.formatting_sync()
    --       end,
    --     })
    --   end
    -- end,

    -- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  })
end

return {
  { 'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    config = function() require('lsp') end,
  },
  { 'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      config = {
        automatic_installation = true,
        ensure_installed = ensure_installed,
      },
    }, -- Bridge for mason-LSP config
  }, -- Auto/manage LSP
  { 'SmiteshP/nvim-navic', config = { highlight = true } }, -- Show LSP context on statusline
  { 'jose-elias-alvarez/null-ls.nvim', config = config_null }, -- Bridge LSP
  -- 'mfussenegger/nvim-lint', -- Linter
  -- 'mhartington/formatter.nvim', -- Formatter
}
