
    ░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗██╗░░░░░░█████╗░░██████╗░
    ██╔══██╗██║░░██║██╔══██╗████╗░██║██╔════╝░██╔════╝██║░░░░░██╔══██╗██╔════╝░
    ██║░░╚═╝███████║███████║██╔██╗██║██║░░██╗░█████╗░░██║░░░░░██║░░██║██║░░██╗░
    ██║░░██╗██╔══██║██╔══██║██║╚████║██║░░╚██╗██╔══╝░░██║░░░░░██║░░██║██║░░╚██╗
    ╚█████╔╝██║░░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗╚█████╔╝╚██████╔╝
    ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝░╚════╝░░╚═════╝░

# DOTFILES CHANGELOG <sup>Please keep me updated :(</sup>
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
### Added

## 2021
### Added
- Send <kbd>Shift</kbd>+<kbd>Enter</kbd> and <kbd>Ctrl</kbd>+<kbd>Enter</kbd> properly. [reference](https://stackoverflow.com/questions/16359878/how-to-map-shift-enter/42461580#42461580)
- Add [mkdx](https://github.com/SidOfc/mkdx/) to Neovim
- Add [Delta](https://github.com/dandavison/delta) to git workflow. <sup>(30/12/2021)</sup>
- Feature to pick symlink options based on OS <sup>(3/1/21)</sup>
- `vim-nfo` <sup>(1/12/2020)</sup>
### Changed
- Tried to follow [keepachangelog](https://keepachangelog.com/en/1.0.0/)<sup>somewhat..</sup>
- Separate config for vim & neovim <sup>(1/12/2021)</sup>
- Move neovim configs to lua <sup>(1/12/2021)</sup>
- `wget` scraping alias <sup>(1/12/2020)</sup>
### Deprecated
### Removed
- [vim-plug] for Neovim
- [CoC](https://github.com/neoclide/coc.nvim) for Neovim
### Fixed
### Security

## 2020
### Added
### Changed
- `wget` scraping alias <sup>(1/12/2020)</sup>

v4.0.0 / 2025-10-18
==================

  * feat(font): add fonts submodule
  * chore(fonts): move fonts to submodule
  * chore(git): remove unused submodules
  * fix(tmux): fix `OSC52` not working in remote connection
  * feat(tmux): add `OSC52` helper script
  * chore(tmux): reenable system clipboard in Linux
  * feat(zsh): update path for brew/pip/go. use zoxide if available
  * feat(ghostty): add initial _ghostty_ config
  * chore(kitty): update fonts
  * chore(nvim): update lazy lock file
  * chore(nvim): change night theme to `kanagawa` for better load time
  * chore(nvim): improve `oil` config
  * chore(nvim): refined `lazy` configs
  * fix(nvim): unnecessary lazy event (make it slower)
  * fix(nvim): `noice` in `statusline` make startup slow ±40ms
  * chore(nvim): remove `dressing.nvim`
  * chore(fonts): update font... (need a way to clean this mess)
  * chore(zsh): update docker aliases
  * chore(zsh): update aliases
  * chore(neovim): update lazy lock
  * fix(neovim): update plugins configs for neovim-12
  * feat(wezterm): add auto light/dark for wezterm
  * chore(starship): update config file
  * feat(gitui): add `catppuccin` & `tokyonight` themes
  * feat(zsh): auto dark/light theme for `zsh-autosuggestions`
  * chore(zsh): regenerate latest `p10k` config with some changes
  * feat(wezterm): use dynamic theme & disable manual colors
  * chore(kitty): update `kitty` configs to use external themes
  * feat(fzf): add auto light/dark theme switcher
  * feat(terminal): add `bat` auto dark/light theme
  * feat(wezterm): add auto light/dark theme
  * feat(terminal): auto dark/light theme for `kitty` & `vivid`
  * feat(zsh): add function `is_day` to decide light or dark themes
  * fix (zsh): light mode should start at 8 o'clock
  * chore(zsh): add more manual completions
  * chore(atuin): default to normal vi-mode
  * chore(nvim): minor tweaks
  * chore(zsh): add `bat` config & `gh` completions
  * chore(nvim): navigate dashboard normally
  * feat(git): experiment with some git config
  * feat(nvim): replace `vim-unimpaired` with `unimpaired.nvim`
  * chore(nvim): update mappings
  * chore(nvim): add `which-key` group & fold mappings
  * chore(nvim): update `lockfile`
  * chore(kitty): add `kitten ssh` alias
  * chore(fonts): update submodule
  * Merge branch 'release/3.5.0'
  * Merge tag 'vv3.5.0' into develop
  * Merge branch 'release/v3.5.0'
  * chore(nvim): update `gitsigns` mapping for `which-key` v3
  * chore(nvim): Set `which-key` v3 options
  * chore(nvim): [wip] which-key v3 trigger disable setup
  * chore(nvim): update `yanky` mappings for `which-key` v3
  * chore(nvim): update `which-key` v3 opts & new syntax
  * feat(nvim): update `lockfile` for `which-key` v3
  * fix(zhs): fix aliases
  * chore(kitty): mostly layout/windows stuff
  * chore(): docs, aliases, dics, dashboard
  * chore(): update submodules
  * chore(): update `.gitignore`
  * chore(zsh): DRY
  * chore(zsh): overwrite some `bindkeys`
  * chore(zsh): move super `ctrl-z` in aliases file
  * chore(cli): remove useless `v` and tweaks `fzf` aliases & functions
  * feat(zsh): add helper to debug `zshrc` startup time
  * feat(zsh): add alias to kill `ms edge` renderer
  * feat(zsh): add alias to view `ohmyzsh` plugins/docs
  * feat(zsh): set default `GREP` program
  * feat(zsh): tweak defaults
  * chore(git): don't track `*.bak` files
  * chore(nvim): update `lockfile`
  * chore(nvim): wip. redo `gitsigns` mappings
  * fix(nvim): `nvim-ts-context-commentstring` no longer require `nvim-treesitter`
  * chore(nvim): markdown plugins change
  * feat(nvim): make `dashboard` shortcut alphabetically
  * feat(nvim): add `leap` preview filter
  * feat(kitty): use `kitten` for ssh & enable `tmux` passthrough
  * chore(wezterm): tweak configs
  * chore(git): disable side-by-side diff for `delta`
  * chore(zfs): add `git-lfs` & `syncthing` completions
  * fix(zhs): append `zplug` & `macport` man location to `MANPATH`
  * feat(): add `editorconfig` config file
  * feat(cli): add `streamlink` config file
  * chore(zsh): keybind load order mostly
  * chore(zsh): update `zsh-autocomplete` configs
  * chore(zsh): plugins housekeeping
  * chore(nvim): update `lazy` lockfile
  * docs(dotfiles): update todos
  * chore(cli): update `atuin` configs
  * chore(kitty): reorganize kitty theme files and add new themes
  * chore(kitty): update `kanagawa` theme from official source
  * chore(kitty): new tab and split now open with `cwd`
  * chore(nvim): update `statuscol` configs, remove `nvim-terminal.lua`
  * chore(nvim): replace github `gist` plugin
  * chore(zsh): add more manual completions
  * docs(): update `README.md`
  * feat(neovide): add `neovide` base config file
  * chore(zsh): add `deno` completions
  * chore(nvim): update `neogit` configs changes from upstream
  * chore(nvim): update lazy `lockfile`
  * chore(nvim): style consistencies
  * fix(neovide): update `neovide` configs, font & mappings
  * fix(nvim): `cmap` missing from `mapper` utils
  * style(git): formatting `retab`
  * chore(nvim): update lockfile
  * chore(git): update `gitconfig`
  * fix(nvim): fix `gitsigns` breaking changes
  * chore(nvim): update lockfile
  * chore(atuin): try configs
  * chore(kitty): update kitty layouts
  * fix(gitui): fix breaking change for theme
  * feat(kitty): add new configs & config syntax color
  * fix(zsh): [WIP] update zshrc
  * chore(todo): update todo, colors & lockfile
  * fix(wezterm): fix **get current working directory**
  * fix(wezterm): fix nerdfonts breaking change
  * fix(zsh): Files for manual completions
  * feat(zsh): add `atuin`!!
  * feat(zsh): add `zsh-edit` plugin
  * feat(zsh): add our own manual completions
  * chore(nvim): update lazy `lockfile`
  * fix(zsh): move `bindkey` under `zvm_after_init`
  * feat(git): add `git root` alias
  * fix(nvim): fix breaking changes from upstream
  * feat(nvim): add `oil.nvim`
  * chore(git): add some aliases
  * fix(gitui): update key bindings & theme
  * fix(nvim): more legacy `null-ls` fix
  * chore(nvim): update `lockfile`
  * fix(nvim): replace depreceated API
  * fix(nvim): replace `null-ls` with `none-ls`
  * fix(docker): `docker compose` is the successor of `docker-compose`
  * chore(nvim): update `lazy` bootstrap base on docs
  * fix(nvim): update `neogit` configs to reflect new maintainer.
  * fix(nvim): buggy `specs.nvim`, `nvim-notify` and properly config `nvim-ufo`
  * chore(nvim): update lockfile
  * fix(nvim): this empty opts causing nvim to SEGFAULT :( REF: https://github.com/neovim/neovim/issues/28396
  * chore: update config files
  * fix(nvim): workaround for mosh problem drawing empty char with neovim
  * docs: update
  * chore: update configs
  * chore: update config files
  * chore: update config files
  * fix(nvim): statuscol use 0.10 branch
  * chore(gitui): auto update theme file
  * chore(nvim): update build command
  * fix(nvim): `sqlite.lua` didn't detect macports' sqlite3 installation ref: https://github.com/kkharji/sqlite.lua/issues/144
  * feat(nnn): add `chmod` and `mediainfo` to plugins
  * feat(zsh): replace `exa` with `eza` if available
  * fix(wezterm): migration from `brew` to `port`
  * fix(nvim): update `indentblankline` config for v3
  * fix(nvim): update `dial` API
  * feat(wezterm): function to select gpu from multi-gpu
  * feat(nvim): enable `vim.loader`
  * chore(nvim): update lockfile
  * fix(nvim): update treesitter API
  * chore(nvim): update `lock` and `spell`
  * feat(zsh): add `zsh-autocomplete` & replace `fast-syntax-hightlight` with `F-Sy-H`
  * feat(nvim): add mappings to open URL under cursor
  * feat(nvim): add `various-textobjs` plugin. Modify `treesitter` mappings
  * feat(lua_ls): update `luarc` configs
  * feat(neovide): add `neovide` configs
  * feat(nvim): update `dashboard` & `nordic` configs
  * fix(nvim): fix `statuscol` breaking change
  * chore(nvim): update `lockfile`
  * fix(nvim): no `s` in `disable_filetype`
  * feat(nvim): `which-key` spelling is now enabled by default
  * fix(zsh): fix `homebrew` path & options
  * fix(nvim): update configs
  * feat(ncurses): add/update `terminfo`
  * feat(wezterm): add more `right status` components
  * Rewrite wezterm config (#32)
  * fix(nvim): fix botched rebase :(
  * chore(nvim): update options
  * feat(nvim): add `dashboard.nvim` & configs
  * chore(nvim): update `telescope` configs
  * feat(terminal): update `ncurses`' `terminfo.src`
  * fix(nvim): check nvim version to use `statuscol.nvim`
  * ref(lsp): rename `sumneko_lua` -> `lua_ls`
  * feat(nvim): add `smart_open` telescope plugin
  * fix(zsh): `p10k` failed when delay loading
  * chore(nvim): update `lockfile`. Set spell.add.spl as binary
  * chore(nvim): modify `null-ls` configs
  * ref(nvim): better mappings
  * fix(nvim): fix LSP warning with dynamic generated mapper
  * chore(nvim): modify `spell` file
  * feat(wezterm): add nordic theme
  * chore(nvim): modify themes
  * feat(zsh): add `fast-syntax-highlighting` & `safe-paste`
  * ref(zsh): simplify existence check
  * docs(notes): add `wezterm` trouble shooting
  * chore(nvim): update `lockfile`
  * chore(nvim): modify mappings
  * ref(nvim): rewrite `statusline`.
  * fix(nvim): fix annotations
  * feat(nvim): replace `vim-tmux-navigator` with `Navigator.nvim`
  * fix(bootstrap): fix as suggested by `bashls`
  * ref(nvim): mapper can accept 4th argument as opts table if the 3rd argument is description string. Simplify `make_opts` function
  * ref(nvim): rewrite lsp mappings
  * Revert "ref(nvim): rewrite LSP mappings to use `which-key`"
  * ref(wezterm): rewrite pane switcher and format with `stylua`
  * fix(nvim): `nvim-tree` deprecate open_on_setup
  * feat(nvim): add `nvim-ufo` to manage folds.
  * chore(nvim): update `lockfile`
  * feat(formatter): add `stylua` config
  * feat(nvim): conceal html class in html & vue
  * feat(nvim): manage plugins
  * feat(nvim): change `colorscheme`
  * chore(nvim): change `cursor`, `windows` & `diagnostics` configs
  * fix(nvim): change lazy loading event to reduce load on directly open file.
  * chore(nvim): add/change/delete mappings.
  * feat(nvim): add `statuscolumn` configs, set `concealcursor=nc`
  * chore(vim): change `colorscheme`
  * chore(nvim): update lazy config & lockfile
  * chore(helix): update configs
  * Feature/rewrite autocmd (#31)
  * fix(git): fix submodule path
  * feat(nvim): replace `ts-rainbow` with the new fork
  * feat(nvim): add remaining mappings description
  * chore(nvim): reorganize plugins, update `lockfile`, formatting, remove unused plugins
  * feat(nvim): add `modes.nvim` for cursorline & cursor highlight since I'm bad at it :/
  * ref(nvim): more granular settings in `ui`
  * feat(nvim): add `aerial` to replace `navic`. Much more feature and less noise.
  * feat(config): add `.luarc.json` configs
  * feat(helix): add `helix` configs
  * feat(nvim): replace `telescope-ui-select` with `dressing` (better perf)
  * chore(nvim): small configs update
  * fix(nvim): disable `tabnine`. Too heavy on resources.
  * feat(nvim): make mapper accept third *arg* as *desc* if string
  * ref(nvim): move tabs & plugins mappings to `which-key`
  * ref(nvim): change from keymap to our mapper
  * ref(nvim): rewrite LSP mappings to use `which-key`
  * ref(nvim): move `vim-osc52` mapping to plugin config (lazy load)
  * ref(nvim): rewrite `gitsigns` mappings to use `which-key`.
  * ref(nvim): rewrite mapper and move to `utils.mapper`
  * ref(nvim): DRY `telescope` mappings
  * ref(nvim): move `easy-align` mappings to plugin config
  * ref(nvim): set `leader` & `localleader` in `options` file. Load it before lazy
  * feat(nvim): convert `Telescope` mappings to use `which-key`
  * ref(nvim): move `treesj` mappings to plugin config
  * ref(nvim): move `windows.nvim` mappings to plugin config
  * ref(nvim): move `vim-tmux-navigator` mappings to plugin config
  * feat(nvim): configure `SnipRun`
  * feat(nvim): improve our window switcher a little
  * feat(nvim): make window switcher Alt+0..Alt+9
  * refactor(nvim): don't be pedantic about shortening everything.
  * feat(nvim): add close mapping to `diffview_file_history` panel
  * fix(nvim): use yank highlight by `yanky` instead
  * fix(nnn): plugin `fzz` was changed to `autojump` to support more app
  * fix(nvim): workaround for opening files from telescope in insert mode.
  * fix(nvim): fix `autocmd` load order so we can open file directly and have it's autocmd applied.
  * perf(nvim): disable custom `runtime_path`, just use neodev. Disable `cmp-nvim-lua`, while it's nice to have custom [API] source, but it's duplicate with `neodev`. And `neodev` give prettier results/docs.
  * fix(nvim): change `config` to `opts` to comply with latest lazy spec
  * refactor(nvim): rename **functions** in utils to follow lua conventions. Clean up old codes
  * refactor(nvim): extract `git` utils to separate file. Rename **functions** to follow lua conventions.
  * chore(kitty): update kitty configs
  * fix(zsh): fix nnn opener in macos
  * fix(nvim): rename `luadev` to `neodev`. Tidy up lsp kind
  * feat(nvim): add autocmds. Save folds, python ft. Tidy up
  * chore(nvim): update `lockfile` & `spellfile`
  * chore(nvim): tidy up `mappings` and `telescope` configs
  * format(nvim): format `theme.lua`. Add `material-nvim` dev
  * feat(nvim): `which-key` enable spell suggest helper
  * chore(nvim): tweak `leap` configs
  * fix(nvim): upgrade to new `diffview` configs format
  * fix(nvim): change debugging keymaps to avoid overlapping
  * feat(stylua): add more rules
  * fix(nvim): use `VeryLazy` event. Clean `leap` configs. Remove `flit`.
  * fix(nvim): add `indent-blankline` ft ignore & lazy load cmd
  * perf(nvim): change `yanky` lazy load event to `BufReadPost`
  * perf(vim): replace `FzfPreview` with `fzf.vim` for better performance.
  * chore(nvim): update `lockfile`
  * chore(nvim): change `lazy` loading events of `leap`, `cmp`, `tmux-navigator` & `nvim-nu` name
  * fix(nvim): disable `treesitter` indent module for python. Format
  * fix(nvim): `windows.lua` animation broke many parts of neovim
  * feat(nvim): add python language server `pylsp`. option to disable format on save
  * fix(nvim): fix `dap` & `dapui` configs
  * fix(nvim): disable auto source lua file on write. - make `IndentBlankline` enable only on ft with extension - replace `setlocal` with `setl`
  * fix(nvim): `lazy` integration with `Diffview.nvim` https://github.com/folke/lazy.nvim/issues/304
  * fix(nvim): fix compatibility with `neogit` hidden terminal.
  * docs(): add docs
  * feat(config): add `stylua` & `editorconfig` configs
  * feat(nvim): telescope add `smart-history` & `ui-select` extensions.
  * chore(nvim): add tab workflow mappings, change `treesj` toggle mapping, format `plugins.lua` & edit `spell` file.
  * docs(todo): update  todo
  * chore(nvim): update `lockfile`
  * fix(nvim): add `code actions` mapping in visual mode too
  * refactor(nvim): change `null-ls` & `mason` as `lspconfig` dependencies so we don't have to manually load them. It's required anyway if LSP is available.
  * ref(nvim): remove `nvim_lsp_signature_help` in favor of `noice` lsp signature
  * feat(nvim): make `fuzzy_buffer` search all buffers
  * fix(nvim): telescope `lsp_code_action` was deprecated. format.
  * feat(nvim): add `null-ls` & formatting
  * feat(nvim): add `Format` command to format buffer
  * feat(nvim): configure `null-ls`
  * chore(nvim): use `vim.o` to set option and add cmd to switch material style
  * chore(nvim): tweak `nightfox` configs
  * chore(nvim): clean `neogit` config
  * feat(git): add `gpg` for credential helper
  * feat(zsh): add composer vendor to `PATH`
  * chore(nvim): update `lockfile`
  * fix(wezterm): fix `ALT` key not working on MacOS
  * fix(nvim): fix lua LSP keeping asking to create config
  * fix(nvim): tweak `telescope`, `treesj`, `windows` & `diffview`
  * feat(nvim): add `headlines.nvim` plugin
  * chore(nvim): remove old `packer` references.
  * fix(nvim): fix spelling & add `spell` file for `ms`
  * feat(nvim): add `yanky` to manage yank/clipboard
  * chore(nvim): update lockfile & formatting
  * chore(nvim): update lockfile
  * feat(nvim): replace `vim-surround` with `nvim-surround`
  * refactor(nvim): remove `mini` suite
  * chore(nvim): change/ref `ui` and `theme` config
  * chore(nvim): small configs changes
  * fix(nvim): `windows.nvim` add ignore filetype & buftype
  * feat(nvim): add`material.nvim` configs
  * chore(nvim): update plugins
  * chore(nvim): enable `lazy` checker
  * feat(nvim): move windows management plugins to `plugins/windows.lua`
  * feat(nvim): add debugging plugins `dap`, `dap-ui` & `sniprun`
  * feat(nvim): add & configure `nvim-navic` -- show  code context in statusline
  * feat(nvim): add & configure `mason` & `mason-lspconfig`
  * feat(nvim): add `neoclip` & configure `nvim-nu`
  * feat(nvim): add & configure `todo-comment`, `zen-mode` & `twilight`
  * feat(nvim): `cmp` reorder fields & modify completion window
  * chore(nvim): remove `spellsitter.nvim`
  * chore(nvim): add `dial` mapping for visual mode
  * chore(nvim): update `noice` config
  * feat(nvim): add `noice` statusline for `command`, `@recording` and `search`. Also don't combine popup, so our cmdline is center.
  * feat(nvim): add `which-key.nvim` & modify some existing keymaps/commands to support which-key
  * feat(nvim): add `noice.nvim`, config in `plugins/noice.lua`
  * feat(nvim): replace `splitjoin` with `treesj`
  * refactor(nvim): move  `tmuxline` to `statusline.lua`
  * feat(nvim): add theme `oxocarbon` & `doom-one`
  * chore(nvim): update `vim.cmd` to use new `vim.cmd.colorscheme`
  * feat(nvim): WIP. Add bunch of new plugins
  * chore(nvim): add `ddate` abbreviation to `%d/%m/%Y`
  * fix(nvim): change lazy loading event from to `InsertEnter *`
  * fix(nvim): change filetype `md` to `markdown`
  * refactor(nvim): change `ui` flow. Reformat `events`
  * refactor(nvim): modify default options
  * chore(nvim): make `neogit` auto refresh git status
  * chore(nvim): update `spell` file
  * fix(nvim): `treesitter-context` must have config for it to work
  * fix(nvim): add missing `nvim-treesitter-textobjects`
  * docs(nvim): update TODO
  * fix(nvim): this option give unseeable cursor in `vimr`
  * refactor(nvim): move plugins with larger configs to own file.
  * refactor(nvim): move `nvim-autopairs` configs to `autopairs.lua`
  * chore(nvim): remove old codes, `packer` cmds
  * fix(nvim): fix `fuzzy-buffer` not loading
  * refactor(nvim): move `Comment.nvim` to own file
  * feat(nvim): add `mini` plugins
  * refactor(nvim): move `undotree` to own file
  * chore(nvim): small fixes & docs
  * refactor(nvim): move `nvim-cmp` plugins and extensions to own file.
  * refactor(nvim): move `nvim-cmp` & related plugins specs to own file
  * refactor(nvim): move `treesitter` & related plugin to `treesitter.lua`
  * refactor(nvim): move `telescope` configs to single file.
  * fix(nvim): fix lazy loading for `unimpaired`, `surround`, `tmux-navigator`, `specs`, `pretty-fold` & `lualine`
  * fix(nvim): remove `FixCursorHold` plugin, fixed in neovim.
  * chore(nvim): add `lazy` update count to `lualine`
  * chore(nvim): exit if last window is `nerdtree` or `neogit`
  * ref(nvim): refactor plugin spec for `lazy`
  * chore(nvim): update lazy config to relax checker a bit
  * chore(nvim): update lazy lockfile
  * chore(nvim): add temp mapping to open last edited file from `v:oldfiles`
  * docs(notes): add Neovim notes
  * feat(nvim): add `dial.nvim` plugin
  * ref(nvim): move configs in `init.lua` under `config/`
  * ref(nvim): plugins config can use simplified options
  * chore(nvim): update plugins spec
  * fix(nvim): fix `lazy` load sequence
  * chore(nvim): update `terminal` escape mapping
  * ref(nvim): update `startify` commands for `lazy`
  * chore(nvim): update plugins
  * refactor(nvim): remove old `packer` mappings
  * fix(nvim): `Lazy` insisted on this :(
  * fix(nvim): always use `lazy.nvim` _cache_ and _lazy_ mode
  * feat(nvim): migrate to `lazy.nvim`
  * feat(nvim): include `spell` file in git
  * fix(nvim): update `diffview` configs
  * chore(nvim): update `Telescope` configs & mapping
  * fmt(): format p10k config
  * docs(): update TODO
  * chore(neovim): make fterm open default shell
  * feat(neovim): add php autocmd
  * feat(nvim): upgrade to `lightspeed` successor `leap`
  * fix(nvim): fix comment.vim always use block comment
  * feat(nvim): add treesitter @outer.comment shortcut
  * chore(nvim): change vimr to nightfox colorscheme
  * feat(art): add new art
  * fix(gitui): fix gutui theme file
  * style(nvim): use nightfox & update it's configs
  * fix(nvim.lsp): fix server_capabilities name
  * fix(nvim): fix `wezterm` configs & color schemes not working
  * chore(nvim): remove pretty fold preview config
  * chore(nvim): lua-dev repo name change to neodev
  * chore(nvim): update nvimtree config
  * chore(nvim): update diffview config
  * chore(nvim): update/fix configs
  * chore(nvim): update gui font to latest *operator*
  * fix(nvim): `filetype.lua` is enabled by default, this workaround no longer needed.
  * chore(nvim): add experimental mapper utils, need rewrite
  * chore(nvim): update treesitter textsubject config
  * refactor(nvim): remove copilot, unstable for usage
  * chore(nvim): update nvim-tree configs
  * feat(nvim): add mapping neogit open replace pane
  * refactor(nvim): move packer bootstrap to init file
  * chore(nvim): update pretty fold config
  * fix(nvim): fix treesitter context commentstring
  * chore(nvim): formatting
  * fix(nvim): rename resolved_capabilities to server_capabilities
  * fix(pnpm): add PNPM_HOME env var to config
  * chore(nvim): update `gitsigns` mapping for `which-key` v3
  * chore(nvim): Set `which-key` v3 options
  * chore(nvim): [wip] which-key v3 trigger disable setup
  * chore(nvim): update `yanky` mappings for `which-key` v3
  * chore(nvim): update `which-key` v3 opts & new syntax
  * feat(nvim): update `lockfile` for `which-key` v3
  * fix(zhs): fix aliases
  * chore(kitty): mostly layout/windows stuff
  * chore(): docs, aliases, dics, dashboard
  * chore(): update submodules
  * chore(): update `.gitignore`
  * chore(zsh): DRY
  * chore(zsh): overwrite some `bindkeys`
  * chore(zsh): move super `ctrl-z` in aliases file
  * chore(cli): remove useless `v` and tweaks `fzf` aliases & functions
  * feat(zsh): add helper to debug `zshrc` startup time
  * feat(zsh): add alias to kill `ms edge` renderer
  * feat(zsh): add alias to view `ohmyzsh` plugins/docs
  * feat(zsh): set default `GREP` program
  * feat(zsh): tweak defaults
  * chore(git): don't track `*.bak` files
  * chore(nvim): update `lockfile`
  * chore(nvim): wip. redo `gitsigns` mappings
  * fix(nvim): `nvim-ts-context-commentstring` no longer require `nvim-treesitter`
  * chore(nvim): markdown plugins change
  * feat(nvim): make `dashboard` shortcut alphabetically
  * feat(nvim): add `leap` preview filter
  * feat(kitty): use `kitten` for ssh & enable `tmux` passthrough
  * chore(wezterm): tweak configs
  * chore(git): disable side-by-side diff for `delta`
  * chore(zfs): add `git-lfs` & `syncthing` completions
  * fix(zhs): append `zplug` & `macport` man location to `MANPATH`
  * feat(): add `editorconfig` config file
  * feat(cli): add `streamlink` config file
  * chore(zsh): keybind load order mostly
  * chore(zsh): update `zsh-autocomplete` configs
  * chore(zsh): plugins housekeeping
  * chore(nvim): update `lazy` lockfile
  * docs(dotfiles): update todos
  * chore(cli): update `atuin` configs
  * chore(kitty): reorganize kitty theme files and add new themes
  * chore(kitty): update `kanagawa` theme from official source
  * chore(kitty): new tab and split now open with `cwd`
  * chore(nvim): update `statuscol` configs, remove `nvim-terminal.lua`
  * chore(nvim): replace github `gist` plugin
  * chore(zsh): add more manual completions
  * docs(): update `README.md`
  * feat(neovide): add `neovide` base config file
  * chore(zsh): add `deno` completions
  * chore(nvim): update `neogit` configs changes from upstream
  * chore(nvim): update lazy `lockfile`
  * chore(nvim): style consistencies
  * fix(neovide): update `neovide` configs, font & mappings
  * fix(nvim): `cmap` missing from `mapper` utils
  * style(git): formatting `retab`
  * chore(nvim): update lockfile
  * chore(git): update `gitconfig`
  * fix(nvim): fix `gitsigns` breaking changes
  * chore(nvim): update lockfile
  * chore(atuin): try configs
  * chore(kitty): update kitty layouts
  * fix(gitui): fix breaking change for theme
  * feat(kitty): add new configs & config syntax color
  * fix(zsh): [WIP] update zshrc
  * chore(todo): update todo, colors & lockfile
  * fix(wezterm): fix **get current working directory**
  * fix(wezterm): fix nerdfonts breaking change
  * fix(zsh): Files for manual completions
  * feat(zsh): add `atuin`!!
  * feat(zsh): add `zsh-edit` plugin
  * feat(zsh): add our own manual completions
  * chore(nvim): update lazy `lockfile`
  * fix(zsh): move `bindkey` under `zvm_after_init`
  * feat(git): add `git root` alias
  * fix(nvim): fix breaking changes from upstream
  * feat(nvim): add `oil.nvim`
  * chore(git): add some aliases
  * fix(gitui): update key bindings & theme
  * fix(nvim): more legacy `null-ls` fix
  * chore(nvim): update `lockfile`
  * fix(nvim): replace depreceated API
  * fix(nvim): replace `null-ls` with `none-ls`
  * fix(docker): `docker compose` is the successor of `docker-compose`
  * chore(nvim): update `lazy` bootstrap base on docs
  * fix(nvim): update `neogit` configs to reflect new maintainer.
  * fix(nvim): buggy `specs.nvim`, `nvim-notify` and properly config `nvim-ufo`
  * chore(nvim): update lockfile
  * fix(nvim): this empty opts causing nvim to SEGFAULT :( REF: https://github.com/neovim/neovim/issues/28396
  * chore: update config files
  * fix(nvim): workaround for mosh problem drawing empty char with neovim
  * docs: update
  * chore: update configs
  * chore: update config files
  * chore: update config files
  * fix(nvim): statuscol use 0.10 branch
  * chore(gitui): auto update theme file
  * chore(nvim): update build command
  * fix(nvim): `sqlite.lua` didn't detect macports' sqlite3 installation ref: https://github.com/kkharji/sqlite.lua/issues/144
  * feat(nnn): add `chmod` and `mediainfo` to plugins
  * feat(zsh): replace `exa` with `eza` if available
  * fix(wezterm): migration from `brew` to `port`
  * fix(nvim): update `indentblankline` config for v3
  * fix(nvim): update `dial` API
  * feat(wezterm): function to select gpu from multi-gpu
  * feat(nvim): enable `vim.loader`
  * chore(nvim): update lockfile
  * fix(nvim): update treesitter API
  * chore(nvim): update `lock` and `spell`
  * feat(zsh): add `zsh-autocomplete` & replace `fast-syntax-hightlight` with `F-Sy-H`
  * feat(nvim): add mappings to open URL under cursor
  * feat(nvim): add `various-textobjs` plugin. Modify `treesitter` mappings
  * feat(lua_ls): update `luarc` configs
  * feat(neovide): add `neovide` configs
  * feat(nvim): update `dashboard` & `nordic` configs
  * fix(nvim): fix `statuscol` breaking change
  * chore(nvim): update `lockfile`
  * fix(nvim): no `s` in `disable_filetype`
  * feat(nvim): `which-key` spelling is now enabled by default
  * fix(zsh): fix `homebrew` path & options
  * fix(nvim): update configs
  * feat(ncurses): add/update `terminfo`
  * feat(wezterm): add more `right status` components
  * Rewrite wezterm config (#32)
  * fix(nvim): fix botched rebase :(
  * chore(nvim): update options
  * feat(nvim): add `dashboard.nvim` & configs
  * chore(nvim): update `telescope` configs
  * feat(terminal): update `ncurses`' `terminfo.src`
  * fix(nvim): check nvim version to use `statuscol.nvim`
  * ref(lsp): rename `sumneko_lua` -> `lua_ls`
  * feat(nvim): add `smart_open` telescope plugin
  * fix(zsh): `p10k` failed when delay loading
  * chore(nvim): update `lockfile`. Set spell.add.spl as binary
  * chore(nvim): modify `null-ls` configs
  * ref(nvim): better mappings
  * fix(nvim): fix LSP warning with dynamic generated mapper
  * chore(nvim): modify `spell` file
  * feat(wezterm): add nordic theme
  * chore(nvim): modify themes
  * feat(zsh): add `fast-syntax-highlighting` & `safe-paste`
  * ref(zsh): simplify existence check
  * docs(notes): add `wezterm` trouble shooting
  * chore(nvim): update `lockfile`
  * chore(nvim): modify mappings
  * ref(nvim): rewrite `statusline`.
  * fix(nvim): fix annotations
  * feat(nvim): replace `vim-tmux-navigator` with `Navigator.nvim`
  * fix(bootstrap): fix as suggested by `bashls`
  * ref(nvim): mapper can accept 4th argument as opts table if the 3rd argument is description string. Simplify `make_opts` function
  * ref(nvim): rewrite lsp mappings
  * Revert "ref(nvim): rewrite LSP mappings to use `which-key`"
  * ref(wezterm): rewrite pane switcher and format with `stylua`
  * fix(nvim): `nvim-tree` deprecate open_on_setup
  * feat(nvim): add `nvim-ufo` to manage folds.
  * chore(nvim): update `lockfile`
  * feat(formatter): add `stylua` config
  * feat(nvim): conceal html class in html & vue
  * feat(nvim): manage plugins
  * feat(nvim): change `colorscheme`
  * chore(nvim): change `cursor`, `windows` & `diagnostics` configs
  * fix(nvim): change lazy loading event to reduce load on directly open file.
  * chore(nvim): add/change/delete mappings.
  * feat(nvim): add `statuscolumn` configs, set `concealcursor=nc`
  * chore(vim): change `colorscheme`
  * chore(nvim): update lazy config & lockfile
  * chore(helix): update configs
  * Feature/rewrite autocmd (#31)
  * fix(git): fix submodule path
  * feat(nvim): replace `ts-rainbow` with the new fork
  * feat(nvim): add remaining mappings description
  * chore(nvim): reorganize plugins, update `lockfile`, formatting, remove unused plugins
  * feat(nvim): add `modes.nvim` for cursorline & cursor highlight since I'm bad at it :/
  * ref(nvim): more granular settings in `ui`
  * feat(nvim): add `aerial` to replace `navic`. Much more feature and less noise.
  * feat(config): add `.luarc.json` configs
  * feat(helix): add `helix` configs
  * feat(nvim): replace `telescope-ui-select` with `dressing` (better perf)
  * chore(nvim): small configs update
  * fix(nvim): disable `tabnine`. Too heavy on resources.
  * Merge pull request #30 from kuntau/feature/rewrite-mapper
  * feat(nvim): make mapper accept third *arg* as *desc* if string
  * ref(nvim): move tabs & plugins mappings to `which-key`
  * ref(nvim): change from keymap to our mapper
  * ref(nvim): rewrite LSP mappings to use `which-key`
  * ref(nvim): move `vim-osc52` mapping to plugin config (lazy load)
  * ref(nvim): rewrite `gitsigns` mappings to use `which-key`.
  * ref(nvim): rewrite mapper and move to `utils.mapper`
  * ref(nvim): DRY `telescope` mappings
  * ref(nvim): move `easy-align` mappings to plugin config
  * ref(nvim): set `leader` & `localleader` in `options` file. Load it before lazy
  * feat(nvim): convert `Telescope` mappings to use `which-key`
  * ref(nvim): move `treesj` mappings to plugin config
  * ref(nvim): move `windows.nvim` mappings to plugin config
  * ref(nvim): move `vim-tmux-navigator` mappings to plugin config
  * feat(nvim): configure `SnipRun`
  * feat(nvim): improve our window switcher a little
  * feat(nvim): make window switcher Alt+0..Alt+9
  * refactor(nvim): don't be pedantic about shortening everything.
  * feat(nvim): add close mapping to `diffview_file_history` panel
  * fix(nvim): use yank highlight by `yanky` instead
  * fix(nnn): plugin `fzz` was changed to `autojump` to support more app
  * fix(nvim): workaround for opening files from telescope in insert mode.
  * fix(nvim): fix `autocmd` load order so we can open file directly and have it's autocmd applied.
  * perf(nvim): disable custom `runtime_path`, just use neodev. Disable `cmp-nvim-lua`, while it's nice to have custom [API] source, but it's duplicate with `neodev`. And `neodev` give prettier results/docs.
  * fix(nvim): change `config` to `opts` to comply with latest lazy spec
  * refactor(nvim): rename **functions** in utils to follow lua conventions. Clean up old codes
  * refactor(nvim): extract `git` utils to separate file. Rename **functions** to follow lua conventions.
  * chore(kitty): update kitty configs
  * fix(zsh): fix nnn opener in macos
  * fix(nvim): rename `luadev` to `neodev`. Tidy up lsp kind
  * feat(nvim): add autocmds. Save folds, python ft. Tidy up
  * chore(nvim): update `lockfile` & `spellfile`
  * chore(nvim): tidy up `mappings` and `telescope` configs
  * format(nvim): format `theme.lua`. Add `material-nvim` dev
  * feat(nvim): `which-key` enable spell suggest helper
  * chore(nvim): tweak `leap` configs
  * fix(nvim): upgrade to new `diffview` configs format
  * fix(nvim): change debugging keymaps to avoid overlapping
  * feat(stylua): add more rules
  * fix(nvim): use `VeryLazy` event. Clean `leap` configs. Remove `flit`.
  * fix(nvim): add `indent-blankline` ft ignore & lazy load cmd
  * perf(nvim): change `yanky` lazy load event to `BufReadPost`
  * perf(vim): replace `FzfPreview` with `fzf.vim` for better performance.
  * chore(nvim): update `lockfile`
  * chore(nvim): change `lazy` loading events of `leap`, `cmp`, `tmux-navigator` & `nvim-nu` name
  * fix(nvim): disable `treesitter` indent module for python. Format
  * fix(nvim): `windows.lua` animation broke many parts of neovim
  * feat(nvim): add python language server `pylsp`. option to disable format on save
  * fix(nvim): fix `dap` & `dapui` configs
  * fix(nvim): disable auto source lua file on write. - make `IndentBlankline` enable only on ft with extension - replace `setlocal` with `setl`
  * fix(nvim): `lazy` integration with `Diffview.nvim` https://github.com/folke/lazy.nvim/issues/304
  * fix(nvim): fix compatibility with `neogit` hidden terminal.
  * docs(): add docs
  * feat(config): add `stylua` & `editorconfig` configs
  * feat(nvim): telescope add `smart-history` & `ui-select` extensions.
  * chore(nvim): add tab workflow mappings, change `treesj` toggle mapping, format `plugins.lua` & edit `spell` file.
  * docs(todo): update  todo
  * Merge pull request #29 from kuntau/lsp-linter-formatter
  * chore(nvim): update `lockfile`
  * fix(nvim): add `code actions` mapping in visual mode too
  * refactor(nvim): change `null-ls` & `mason` as `lspconfig` dependencies so we don't have to manually load them. It's required anyway if LSP is available.
  * ref(nvim): remove `nvim_lsp_signature_help` in favor of `noice` lsp signature
  * feat(nvim): make `fuzzy_buffer` search all buffers
  * fix(nvim): telescope `lsp_code_action` was deprecated. format.
  * feat(nvim): add `null-ls` & formatting
  * feat(nvim): add `Format` command to format buffer
  * feat(nvim): configure `null-ls`
  * chore(nvim): use `vim.o` to set option and add cmd to switch material style
  * chore(nvim): tweak `nightfox` configs
  * chore(nvim): clean `neogit` config
  * feat(git): add `gpg` for credential helper
  * feat(zsh): add composer vendor to `PATH`
  * chore(nvim): update `lockfile`
  * fix(wezterm): fix `ALT` key not working on MacOS
  * fix(nvim): fix lua LSP keeping asking to create config
  * fix(nvim): tweak `telescope`, `treesj`, `windows` & `diffview`
  * feat(nvim): add `headlines.nvim` plugin
  * chore(nvim): remove old `packer` references.
  * fix(nvim): fix spelling & add `spell` file for `ms`
  * feat(nvim): add `yanky` to manage yank/clipboard
  * chore(nvim): update lockfile & formatting
  * chore(nvim): update lockfile
  * Merge pull request #28 from kuntau/feature/bunch-of-new-plugins
  * feat(nvim): replace `vim-surround` with `nvim-surround`
  * refactor(nvim): remove `mini` suite
  * chore(nvim): change/ref `ui` and `theme` config
  * chore(nvim): small configs changes
  * fix(nvim): `windows.nvim` add ignore filetype & buftype
  * feat(nvim): add`material.nvim` configs
  * chore(nvim): update plugins
  * chore(nvim): enable `lazy` checker
  * feat(nvim): move windows management plugins to `plugins/windows.lua`
  * feat(nvim): add debugging plugins `dap`, `dap-ui` & `sniprun`
  * feat(nvim): add & configure `nvim-navic` -- show  code context in statusline
  * feat(nvim): add & configure `mason` & `mason-lspconfig`
  * feat(nvim): add `neoclip` & configure `nvim-nu`
  * feat(nvim): add & configure `todo-comment`, `zen-mode` & `twilight`
  * feat(nvim): `cmp` reorder fields & modify completion window
  * chore(nvim): remove `spellsitter.nvim`
  * chore(nvim): add `dial` mapping for visual mode
  * chore(nvim): update `noice` config
  * feat(nvim): add `noice` statusline for `command`, `@recording` and `search`. Also don't combine popup, so our cmdline is center.
  * feat(nvim): add `which-key.nvim` & modify some existing keymaps/commands to support which-key
  * feat(nvim): add `noice.nvim`, config in `plugins/noice.lua`
  * feat(nvim): replace `splitjoin` with `treesj`
  * refactor(nvim): move  `tmuxline` to `statusline.lua`
  * feat(nvim): add theme `oxocarbon` & `doom-one`
  * chore(nvim): update `vim.cmd` to use new `vim.cmd.colorscheme`
  * feat(nvim): WIP. Add bunch of new plugins
  * chore(nvim): add `ddate` abbreviation to `%d/%m/%Y`
  * fix(nvim): change lazy loading event from to `InsertEnter *`
  * fix(nvim): change filetype `md` to `markdown`
  * refactor(nvim): change `ui` flow. Reformat `events`
  * refactor(nvim): modify default options
  * chore(nvim): make `neogit` auto refresh git status
  * chore(nvim): update `spell` file
  * fix(nvim): `treesitter-context` must have config for it to work
  * fix(nvim): add missing `nvim-treesitter-textobjects`
  * docs(nvim): update TODO
  * fix(nvim): this option give unseeable cursor in `vimr`
  * Merge pull request #27 from kuntau/feature/rewrite-plugin-specs
  * refactor(nvim): move plugins with larger configs to own file.
  * refactor(nvim): move `nvim-autopairs` configs to `autopairs.lua`
  * chore(nvim): remove old codes, `packer` cmds
  * fix(nvim): fix `fuzzy-buffer` not loading
  * refactor(nvim): move `Comment.nvim` to own file
  * feat(nvim): add `mini` plugins
  * refactor(nvim): move `undotree` to own file
  * chore(nvim): small fixes & docs
  * refactor(nvim): move `nvim-cmp` plugins and extensions to own file.
  * refactor(nvim): move `nvim-cmp` & related plugins specs to own file
  * refactor(nvim): move `treesitter` & related plugin to `treesitter.lua`
  * refactor(nvim): move `telescope` configs to single file.
  * fix(nvim): fix lazy loading for `unimpaired`, `surround`, `tmux-navigator`, `specs`, `pretty-fold` & `lualine`
  * fix(nvim): remove `FixCursorHold` plugin, fixed in neovim.
  * chore(nvim): add `lazy` update count to `lualine`
  * chore(nvim): exit if last window is `nerdtree` or `neogit`
  * ref(nvim): refactor plugin spec for `lazy`
  * chore(nvim): update lazy config to relax checker a bit
  * chore(nvim): update lazy lockfile
  * chore(nvim): add temp mapping to open last edited file from `v:oldfiles`
  * docs(notes): add Neovim notes
  * feat(nvim): add `dial.nvim` plugin
  * ref(nvim): move configs in `init.lua` under `config/`
  * ref(nvim): plugins config can use simplified options
  * chore(nvim): update plugins spec
  * fix(nvim): fix `lazy` load sequence
  * chore(nvim): update `terminal` escape mapping
  * Merge branch 'feature/migrate-to-lazy.nvim' into develop
  * ref(nvim): update `startify` commands for `lazy`
  * chore(nvim): update plugins
  * refactor(nvim): remove old `packer` mappings
  * fix(nvim): `Lazy` insisted on this :(
  * fix(nvim): always use `lazy.nvim` _cache_ and _lazy_ mode
  * feat(nvim): migrate to `lazy.nvim`
  * feat(nvim): include `spell` file in git
  * fix(nvim): update `diffview` configs
  * chore(nvim): update `Telescope` configs & mapping
  * fmt(): format p10k config
  * docs(): update TODO
  * chore(neovim): make fterm open default shell
  * feat(neovim): add php autocmd
  * feat(nvim): upgrade to `lightspeed` successor `leap`
  * fix(nvim): fix comment.vim always use block comment
  * feat(nvim): add treesitter @outer.comment shortcut
  * chore(nvim): change vimr to nightfox colorscheme
  * feat(art): add new art
  * fix(gitui): fix gutui theme file
  * style(nvim): use nightfox & update it's configs
  * fix(nvim.lsp): fix server_capabilities name
  * fix(nvim): fix `wezterm` configs & color schemes not working
  * chore(nvim): remove pretty fold preview config
  * chore(nvim): lua-dev repo name change to neodev
  * chore(nvim): update nvimtree config
  * chore(nvim): update diffview config
  * chore(nvim): update/fix configs
  * chore(nvim): update gui font to latest *operator*
  * fix(nvim): `filetype.lua` is enabled by default, this workaround no longer needed.
  * chore(nvim): add experimental mapper utils, need rewrite
  * chore(nvim): update treesitter textsubject config
  * refactor(nvim): remove copilot, unstable for usage
  * chore(nvim): update nvim-tree configs
  * feat(nvim): add mapping neogit open replace pane
  * refactor(nvim): move packer bootstrap to init file
  * chore(nvim): update pretty fold config
  * fix(nvim): fix treesitter context commentstring
  * chore(nvim): formatting
  * fix(nvim): rename resolved_capabilities to server_capabilities
  * fix(pnpm): add PNPM_HOME env var to config
  * Merge pull request #8 from kuntau/develop
  * Merge branch 'develop'
  * Merge branch 'develop'
  * Merge branch 'develop'
  * Merge branch 'release/2.0.0'
  * Merge pull request #2 from kuntau/develop
  * Merge branch 'release/v0.1.1'
  * Merge branch 'release/v0.1.0'
  * enable powerline related stuff
