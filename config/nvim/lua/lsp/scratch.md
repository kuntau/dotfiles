# LOG

// -- [07:15:33]

```lua
local client = {
  _on_attach = function() end,
  attached_buffers = {
    [2] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [48] = true
  },
  cancel_request = <function 2>,
  commands = {},
  config = {
    _on_attach = <function 3>,
    autostart = true,
    capabilities = {
      callHierarchy = {
        dynamicRegistration = false
      },
      textDocument = {
        codeAction = {
          codeActionLiteralSupport = {
            codeActionKind = {
              valueSet = { "", "Empty", "QuickFix", "Refactor", "RefactorExtract", "RefactorInline", "RefactorRewrite", "Source", "SourceOrganizeImports", "quickfix", "refactor", "refactor.extract", "refactor.inline", "refactor.rewrite", "source", "source.organizeImports" }
            }
          },
          dataSupport = true,
          dynamicRegistration = false,
          resolveSupport = {
            properties = { "edit" }
          }
        },
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            insertReplaceSupport = true,
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionItemKind = {
            valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
          },
          contextSupport = false,
          dynamicRegistration = false
        },
        declaration = {
          linkSupport = true
        },
        definition = {
          linkSupport = true
        },
        documentHighlight = {
          dynamicRegistration = false
        },
        documentSymbol = {
          dynamicRegistration = false,
          hierarchicalDocumentSymbolSupport = true,
          symbolKind = {
            valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
          }
        },
        hover = {
          contentFormat = { "markdown", "plaintext" },
          dynamicRegistration = false
        },
        implementation = {
          linkSupport = true
        },
        publishDiagnostics = {
          relatedInformation = true,
          tagSupport = {
            valueSet = { 1, 2 }
          }
        },
        references = {
          dynamicRegistration = false
        },
        rename = {
          dynamicRegistration = false,
          prepareSupport = true
        },
        signatureHelp = {
          dynamicRegistration = false,
          signatureInformation = {
            activeParameterSupport = true,
            documentationFormat = { "markdown", "plaintext" },
            parameterInformation = {
              labelOffsetSupport = true
            }
          }
        },
        synchronization = {
          didSave = true,
          dynamicRegistration = false,
          willSave = false,
          willSaveWaitUntil = false
        },
        typeDefinition = {
          linkSupport = true
        }
      },
      window = {
        showDocument = {
          support = false
        },
        showMessage = {
          messageActionItem = {
            additionalPropertiesSupport = false
          }
        },
        workDoneProgress = true
      },
      workspace = {
        applyEdit = true,
        configuration = true,
        symbol = {
          dynamicRegistration = false,
          hierarchicalWorkspaceSymbolSupport = true,
          symbolKind = {
            valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
          }
        },
        workspaceEdit = {
          resourceOperations = { "rename", "create", "delete" }
        },
        workspaceFolders = true
      }
    },
    cmd = { "lua-language-server" },
    cmd_cwd = "/Users/kuntau/dotfiles",
    filetypes = { "lua" },
    flags = {
      debounce_text_changes = 150
    },
    get_language_id = <function 4>,
    handlers = <1>{},
    init_options = vim.empty_dict(),
    log_level = 2,
    message_level = 2,
    name = "sumneko_lua",
    on_attach = <function 5>,
    on_exit = <function 6>,
    on_init = <function 7>,
    root_dir = "/Users/kuntau/dotfiles",
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        runtime = {
          path = { "./?.lua", "/Users/runner/work/neovim/neovim/.deps/usr/share/luajit-2.1.0-beta3/?.lua", "/usr/local/share/lua/5.1/?.lua", "/usr/local/share/lua/5.1/?/init.lua", "/Users/runner/work/neovim/neovim/.deps/usr/share/lua/5.1/?.lua", "/Users/runner/work/neovim/neovim/.deps/usr/share/lua/5.1/?/init.lua", "/Users/kuntau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua", "/Users/kuntau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua", "/Users/kuntau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua", "/Users/kuntau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua", "lua/?.lua", "lua/?/init.lua" },
          version = "LuaJIT"
        },
        telemetry = {
          enable = false
        },
        workspace = {
          library = { "/Users/kuntau/.config/nvim", "/Users/kuntau/.local/share/nvim/site", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/impatient.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/kanagawa.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/lualine.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/nvim-web-devicons", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/plenary.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/sqlite.lua", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/tokyonight.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/vim-startify", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/Comment.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-peekup", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/mkdx", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/vim-surround", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/close-buffers.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-terminal.lua", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/scratch.vim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/vim-rsi", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-autopairs", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/project.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/telescope.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-tmux", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-tabnine", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp_luasnip", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-buffer", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-path", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-copilot", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-cmdline", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/LuaSnip", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/copilot.vim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-cmp", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/vim-matchup", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/pretty-fold.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/friendly-snippets", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/specs.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/packer.nvim", "/Users/kuntau/Applications/VimR.app/Contents/Resources/NvimView_NvimView.bundle/Contents/Resources/runtime", "/usr/local/lib/nvim", "/Users/kuntau/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/mkdx/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-path/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-copilot/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/after", "/Users/kuntau/.local/share/nvim/site/pack/packer/opt/vim-matchup/after" }
        }
      }
    },
    single_file_support = true,
    workspace_folders = <2>{ {
        name = "/Users/kuntau/dotfiles",
        uri = "file:///Users/kuntau/dotfiles"
      } },
    <metatable> = <3>{
      __tostring = <function 8>
    }
  },
  handlers = <table 1>,
  id = 4,
  initialized = true,
  is_stopped = <function 9>,
  messages = {
    messages = {},
    name = "sumneko_lua",
    progress = {},
    status = {}
  },
  name = "sumneko_lua",
  notify = <function 10>,
  offset_encoding = "utf-16",
  request = <function 11>,
  request_sync = <function 12>,
  requests = {},
  resolved_capabilities = {
    call_hierarchy = false,
    code_action = <4>{
      codeActionKinds = { "", "quickfix", "refactor.rewrite", "refactor.extract" },
      resolveProvider = false
    },
    code_lens = false,
    code_lens_resolve = false,
    completion = true,
    declaration = false,
    document_formatting = false,
    document_highlight = true,
    document_range_formatting = false,
    document_symbol = true,
    execute_command = true,
    find_references = true,
    goto_definition = true,
    hover = true,
    implementation = false,
    rename = true,
    signature_help = true,
    signature_help_trigger_characters = <5>{ "(", "," },
    text_document_did_change = 2,
    text_document_open_close = true,
    text_document_save = false,
    text_document_save_include_text = false,
    text_document_will_save = false,
    text_document_will_save_wait_until = false,
    type_definition = true,
    workspace_folder_properties = {
      changeNotifications = false,
      supported = false
    },
    workspace_symbol = true
  },
  rpc = {
    handle = <userdata 1>,
    notify = <function 13>,
    pid = 50328,
    request = <function 14>
  },
  server_capabilities = {
    codeActionProvider = <table 4>,
    completionProvider = {
      resolveProvider = true,
      triggerCharacters = { "\t", "\n", ".", ":", "(", "'", '"', "[", ",", "#", "*", "@", "|", "=", "-", "{", "/", "\\", " ", "+", "?" }
    },
    definitionProvider = true,
    documentHighlightProvider = true,
    documentOnTypeFormattingProvider = {
      firstTriggerCharacter = "\n"
    },
    documentSymbolProvider = true,
    executeCommandProvider = {
      commands = { "lua.removeSpace:50328", "lua.solve:50328", "lua.jsonToLua:50328", "lua.setConfig:50328", "lua.autoRequire:50328" }
    },
    foldingRangeProvider = true,
    hoverProvider = true,
    offsetEncoding = "utf-16",
    referencesProvider = true,
    renameProvider = {
      prepareProvider = true
    },
    signatureHelpProvider = {
      triggerCharacters = <table 5>
    },
    textDocumentSync = {
      change = 2,
      openClose = true
    },
    typeDefinitionProvider = true,
    workspaceSymbolProvider = true
  },
  stop = <function 15>,
  supports_method = <function 16>,
  workspaceFolders = <table 2>,
  workspace_did_change_configuration = <function 17>,
  workspace_folders = <table 2>
}
```

# Snippets

```lua
local job = require('plenary.job')
job:new({
    command = 'curl',
    args = {'icanhazip.com'},
    on_exit = function(j, exit_code)
        local res = table.concat(j:result(), "\n")
        local type = "Success!"

        if exit_code ~=0 then
            type = "Error!"
        end
        print(type, res)
    end,
}):start()
```
