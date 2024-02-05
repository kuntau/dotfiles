
    ████████╗░█████╗░██████╗░░█████╗░
    ╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗
    ░░░██║░░░██║░░██║██║░░██║██║░░██║
    ░░░██║░░░██║░░██║██║░░██║██║░░██║
    ░░░██║░░░╚█████╔╝██████╔╝╚█████╔╝
    ░░░╚═╝░░░░╚════╝░╚═════╝░░╚════╝░

## Rust overlord takeover
- [-] `bottom` over `top`, `htop`, `btop` or `ctop`
- [x] `ripgrep` over `grep`
- [x] `fd` over `find`
- [x] `exa` or `lsd` over `ls`
- [x] `dust` over `du`
- [x] `nu` over `zsh`
- [ ] `zoxide` over `zsh-z`
- [ ] `Zellij` over `TMUX`

## INSTALL SCRIPT
- [x] Borrow code from `ohmyzsh` installer
- [x] OS detection in install script for BSD/Linux difference

### AVAILABILITY FEATURE CHECKLIST
- [x] ZSH
- [x] Git & version
- [x] NodeJS
- [x] TMUX
- [x] Neovim
- [x] Vim & version
- [x] FZF
- [x] Go
- [ ] PHP

### Symlinks on install
- [x] Symlink zshrc
- [x] Symlink vimrc
- [x] Symlink .gitignore
- [x] .vimrc -> init.vim

## (Neo)ViM
- [x] Use `ale` as `coc.nvim` replacement when `nodejs` not avaiable
  - [x] Irrelevant since now we use `lazy`
- [x] Install `mason.nvim` to automate installing LSP servers
- [x] Rewrite regular mappings/use lua API
- [x] Rewrite LSP mappings
- [x] Make mapping have `desc` for `which_key` support
- [x] Write proper handler for LSP capabilities

## Config file
- [x] Reorganize config files
- [x] Make separate config file for each OS
- [x] Update install script
- [ ] Make `zplug` manage `fzf` update

## NNN
- [x] Make unique bookmarks for each machine
