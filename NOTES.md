
    ███╗░░██╗░█████╗░████████╗███████╗░██████╗
    ████╗░██║██╔══██╗╚══██╔══╝██╔════╝██╔════╝
    ██╔██╗██║██║░░██║░░░██║░░░█████╗░░╚█████╗░
    ██║╚████║██║░░██║░░░██║░░░██╔══╝░░░╚═══██╗
    ██║░╚███║╚█████╔╝░░░██║░░░███████╗██████╔╝
    ╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░

## Building Neovim

1. Clone neovim repo `https://github.com/neovim/neovim.git`
2. Make with `make CMAKE_BUILD_TYPE=Release install`
3. To change install directory add `CMAKE_INSTALL_PREFIX=$HOME/Example/Dir` to command above
4. Try `rm -rf build` if build fails after pulling from _master_

## Troubeshooting

### `unknown terminal type` = missing `terminfo`

If we got error `unknown terminal type` while setting up the `TERM` value, it's because we're missing `terminfo` information for that particular `TERM` on current machine. To solve this, we need another machine that have that `terminfo`. Here's how we can get that info for current machine.
1. Export from donor machine `infocmp -x _<TERM_NAME>_ > _<FILENAME>_`
2. Transfer _<FILENAME>_ to current machine.
3. Import with `tic -x _<FILENAME>_`
4. Set our `TERM` env with new _<TERM_NAME>_

### Error installing neovim **HEAD** with `homebrew`

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

> This should be fixed in Homebrew for now. You need to do `brew unlink libvterm` (or `brew uninstall --force libvterm` if you don't otherwise need it) if you have Homebrew installed into `/usr/local`.
> If that still doesn't work, do `brew update` first.
