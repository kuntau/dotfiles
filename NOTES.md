    ███╗░░██╗░█████╗░████████╗███████╗░██████╗
    ████╗░██║██╔══██╗╚══██╔══╝██╔════╝██╔════╝
    ██╔██╗██║██║░░██║░░░██║░░░█████╗░░╚█████╗░
    ██║╚████║██║░░██║░░░██║░░░██╔══╝░░░╚═══██╗
    ██║░╚███║╚█████╔╝░░░██║░░░███████╗██████╔╝
    ╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░

# Neovim

## Building Neovim

1. Clone Neovim repo `https://github.com/neovim/neovim.git`
2. Make with `make CMAKE_BUILD_TYPE=Release install`
3. To change install directory add `CMAKE_INSTALL_PREFIX=$HOME/Example/Dir` to command above
4. Try `rm -rf build` if build fails after pulling from _master_
5. Even better, do `make distclean and make CMAKE_BUILD_TYPE=Release`

## Troubleshooting

### `unknown terminal type` = missing `terminfo`

If we got error `unknown terminal type` while setting up the `TERM` value, it's because we're missing `terminfo`
information for that particular `TERM` on current machine. To solve this, we need another machine that have that
`terminfo`. Here's how we can get that info for current machine.

1. Export from donor machine `infocmp -x _<TERM_NAME>_ > _<FILENAME>_`
2. Transfer _<FILENAME>_ to current machine.
3. Import with `tic -x _<FILENAME>_`
4. Set our `TERM` env with new _<TERM_NAME>_

### Error installing Neovim **HEAD** with `homebrew`

If we got the following error

```
==> make install
Last 15 lines from /Users/me/Library/Logs/Homebrew/neovim/04.make:
[ 50%] Building C object src/nvim/CMakeFiles/nvim.dir/ui.c.o
cd /tmp/neovim-20211103-75787-zm3uzo/build/src/nvim && /usr/local/Homebrew/Library/Homebrew/shims/mac/super/clang -DINCLUDE_GENERATED_DECLARATIONS -DMIN_LOG_LEVEL=3 -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -Dnvim_EXPORTS -I/tmp/neovim-20211103-75787-zm3uzo/build/config -I/tmp/neovim-20211103-75787-zm3uzo/src -I/tmp/neovim-20211103-75787-zm3uzo/build/src/nvim/auto -I/tmp/neovim-20211103-75787-zm3uzo/build/include -I/usr/local/opt/luajit-openresty/include/luajit-2.1 -isystem /usr/local/opt/gettext/include -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -DNVIM_TS_HAS_SET_MATCH_LIMIT -O2 -DNDEBUG -flto=thin -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wmissing-prototypes -Wimplicit-fallthrough -Wvla -fstack-protector-strong -fno-common -fdiagnostics-color=auto -MD -MT src/nvim/CMakeFiles/nvim.dir/ui.c.o -MF CMakeFiles/nvim.dir/ui.c.o.d -o CMakeFiles/nvim.dir/ui.c.o -c /tmp/neovim-20211103-75787-zm3uzo/src/nvim/ui.c
/tmp/neovim-20211103-75787-zm3uzo/src/nvim/terminal.c:818:29: error: passing 'VTermStringFragment' to parameter of incompatible type 'char *'
    buf_set_term_title(buf, val->string);
                            ^~~~~~~~~~~
/tmp/neovim-20211103-75787-zm3uzo/src/nvim/terminal.c:789:50: note: passing argument to parameter 'title' here
static void buf_set_term_title(buf_T *buf, char *title)
```

#### [Solution](https://github.com/neovim/neovim/issues/16217#issuecomment-959793388)

> This should be fixed in Homebrew for now. You need to do `brew unlink libvterm` (or `brew uninstall --force libvterm`
> if you don't otherwise need it) if you have Homebrew installed into `/usr/local`. If that still doesn't work, do
> `brew update` first.

## Tips

1. Spelling

- `]s` or `[s` to jump to misspelled words.
- `zg` to add word under cursor to external dictionary.
- `z=` to get suggestions for misspelled word under cursor.

2. Neovim <3 Lua

- To access `vim` function from lua, prefix the function with `vim.fn`. Ex. `vim.fn.fnameescape`
- To access `vim` variable from lua, prefix the function with `vim.v`. Ex. `vim.v.oldfiles`
- To access `vim` global settings from lua, prefix the function with `vim.g`. Ex. `vim.g.loaded_zip`
- To access `vim` options from lua, prefix the function with `vim.opt`. Ex. `vim.opt.clipboard`

# Wezterm

## Wezterm not detecting foreground process

Regarding this [issue](https://github.com/wez/wezterm/issues/1898) with `Wezterm`. It's actually `zplug` fault for not clearing
it's job lock file in `~/.zplug/log/job.lock`, this maybe happened when we interrupt zplug process forcefully.

This [solution](https://github.com/zplug/zplug/issues/322) is found while searching why `zsh` can't send process to
background with <kbd>CTRL</kbd>+<kbd>z</kbd> and looking at `Wezterm` REPL/debug message
(<kbd>SHIFT</kbd>+<kbd>CTRL</kbd>+<kbd>L</kbd>), no other foreground process got detected.

So if you use `zplug` and have the same problem, find the `~/.zplug/log/job.lock` and delete it.

## Glitch over remote connections
- First happens in mosh
- Only recently
- Seen in neovim, `tmux`, `nnn`
- Also happens over SSH
- Still happens in `Zellij`
- Also happens with `wezterm` over `mosh`
- `SSH` with `Tmux` on `wezterm` ok currently
