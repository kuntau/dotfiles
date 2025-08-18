
    ████████╗░█████╗░██████╗░░█████╗░
    ╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗
    ░░░██║░░░██║░░██║██║░░██║██║░░██║
    ░░░██║░░░██║░░██║██║░░██║██║░░██║
    ░░░██║░░░╚█████╔╝██████╔╝╚█████╔╝
    ░░░╚═╝░░░░╚════╝░╚═════╝░░╚════╝░

## Rust overlord takeover
- [-] `zoxide` over `zsh-z`
- [ ] ~`Zellij` over `TMUX`~

## Install script
- [ ] Detection for Android

### Dependencies check on install
- [-] Core
  - [x] `git`
  - [x] `node`
  - [ ] `tmux`
  - [ ] `bat`
  - [ ] `fzf`
  - [ ] `fd`
  - [ ] `rg`
  - [ ] `eza`
  - [ ] `curl`
  - [ ] `rsync`
- [ ] `npm`
- [ ] `pnpm`
- [ ] `ncdu`
- [ ] `rclone`
- [ ] `bfs`
- [ ] `gitui`
- [ ] `atuin`
- [ ] `vivid`

### Symlinks on install
- [x] Neovim -> init.lua
- [ ] Configs in `~`
  - [x] `p10k`
  - [x] `zshrc`
  - [x] `vimrc`
  - [x] `tmux`
  - [x] `ideavimrc`
  - [x] `tigrc`
  - [x] `gitconfig`
  - [x] `gitignore`
  - [ ] `ripgreprc`
  - [ ] `bashrc`
  - [ ] `luarc`
  - [ ] ~~`starship`~~
  - [ ] ~`fast-syntax-highlighting`~ 
- [ ] Configs in `~/.config`
  - [ ] `kitty`
  - [ ] `ghostty`
  - [ ] `wezterm`
  - [ ] `atuin`
  - [ ] `gitui`
  - [ ] `rclone`
  - [ ] `bat` 
  - [ ] `nu`
  - [ ] `nnn`

## Shell
- [x] Function to return *day* or *night*
- [x] Change terminal *theme* based on *time*
- [-] Change prompt *theme* based on *time* (`p10k`)
  - [x] Maybe it's the right time to switch to `starship`?
  - [x] Nah... `starship` sucks
- [-] Change `gitui` *theme* based on *time*

## Terminal apps to have auto dark/light switch

> [!NOTE]
> Unless we want to convert any theme for each app, our best bet is to use **catppuccin** which is ubiquitous. It even has theme for `fast-syntax-highlighting`

- [x] [Kitty](https://sw.kovidgoyal.net/kitty)
- [x] [Wezterm](https://wezfurlong.org/wezterm)
- [x] [Ghostty](https://ghostty.org)
- [x] [bat](https://github.com/sharkdp/bat)
- [x] [fzf](https://github.com/junegunn/fzf)
    - [x] [fzf in gitconfig](https://github.com/junegunn/fzf)
    - [x] [fzf in git fuzzy](https://github.com/junegunn/fzf)
    - [x] [fzf in enhancd](https://github.com/junegunn/fzf)
- [x] [vivid](https://github.com/sharkdp/vivid)
- [x] [nnn](https://github.com/jarun/nnn) ℹ `LS_COLORS`?
- [ ] [powerlevel10k](https://github.com/romkatv/powerlevel10k) ℹ Hard, scattered in **1.6k** lines file
- [x] ~~[starship](https://starship.rs) ℹ `starship` is not any easier than `p10k` to do dynamic theme!~~ ℹ Too slow!
- [ ] [F-Sy-H](https://github.com/z-shell/F-Sy-H) use `fast-theme`
- [x] [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [ ] [gitui](https://github.com/extrawurst/gitui) ℹ Oh I hate to dynamically theme `toml` file...
  - [ ] `gitui` theme [references](https://github.com/gitui-org/gitui/blob/master/THEMES.md)
  - [ ] pass `-t <theme name>` argument to load theme file
  - [ ] There's `catppuccin` theme for `gitui` now
  - [ ] Figure out how to customize theme from `git` `g` alias
- [ ] [tmux](https://github.com/tmux/tmux)
- [ ] [delta](https://github.com/dandavison/delta) ℹ Config is in `gitconfig`
- [x] [eza?](https://github.com/eza-community/eza) ℹ Maybe is using `LS_COLORS`

## (Neo)ViM
- [ ] 

## Config file
- [-] Reorganize config files
- [ ] Make separate config file for each OS
- [x] Update install script
- [ ] Make `zplug` manage `fzf` update

## NNN
- [x] Make unique bookmarks for each machine
